/**
 * @file compressor_g.inl
 * @author Jiannan Tian
 * @brief compression pipeline
 * @version 0.3
 * @date 2023-06-06
 * (create) 2020-02-12; (release) 2020-09-20;
 *
 * @copyright (C) 2020 by Washington State University, The University of
 * Alabama, Argonne National Laboratory See LICENSE in top-level directory
 *
 */

#ifndef A2519F0E_602B_4798_A8EF_9641123095D9
#define A2519F0E_602B_4798_A8EF_9641123095D9

#include "busyheader.hh"
#include "compressor.hh"
#include "cusz/type.h"
#include "header.h"
#include "hf/hf.hh"
#include "kernel.hh"
#include "log.hh"
#include "mem.hh"
#include "mem/memseg_cxx.hh"
#include "port.hh"
#include "utils/config.hh"
#include "utils/err.hh"

// [psz::note] psz::histogram is left for evaluating purpose
// compared to psz::histsp
#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_1API)
#define PSZ_HIST(...) psz::histsp<PROPER_GPU_BACKEND, E>(__VA_ARGS__);
#elif defined(PSZ_USE_HIP)
#define PSZ_HIST(...) psz::histogram<PROPER_GPU_BACKEND, E>(__VA_ARGS__);
#endif

namespace cusz {

template <class C>
Compressor<C>* Compressor<C>::destroy()
{
  if (mem) delete mem;
  if (codec) delete codec;

  return this;
}

template <class C>
Compressor<C>::~Compressor()
{
  destroy();
}

//------------------------------------------------------------------------------

template <class C>
template <class CONFIG>
Compressor<C>* Compressor<C>::init(CONFIG* config, bool debug)
{
  codec = new Codec;

  const auto radius = config->radius;
  const auto pardeg = config->vle_pardeg;
  // const auto density_factor = config->nz_density_factor;
  // const auto codec_config = config->codecs_in_use;
  const auto booklen = radius * 2;
  const auto x = config->x;
  const auto y = config->y;
  const auto z = config->z;

  len = x * y * z;

  mem = new pszmempool_cxx<T, E, H>(x, radius, y, z);

  codec->init(mem->len, booklen, pardeg, debug);

  return this;
}

template <class C>
Compressor<C>* Compressor<C>::compress(
    cusz_context* config, T* in, BYTE*& out, size_t& outlen, void* stream,
    bool dbg_print)
{
  PSZSANITIZE_PSZCTX(config);

  auto const eb = config->eb;
  auto const radius = config->radius;
  auto const pardeg = config->vle_pardeg;

  auto div = [](auto whole, auto part) { return (whole - 1) / part + 1; };

// [psz::note::TODO] compat layer or explicit macro
#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
  len3 = dim3(config->x, config->y, config->z);
#elif defined(PSZ_USE_1API)
  sycl::range<3> len3(config->z, config->y, config->x);
#endif

  BYTE* d_codec_out{nullptr};
  size_t codec_outlen{0};

  size_t data_len = config->x * config->y * config->z;
  auto booklen = radius * 2;

  auto sublen = div(data_len, pardeg);

  auto update_header = [&]() {
#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
    header.x = len3.x, header.y = len3.y, header.z = len3.z,
#elif defined(PSZ_USE_1API)
    header.x = len3[2], header.y = len3[1], header.z = len3[0],
#endif
    header.w = 1;  // placeholder
    header.radius = radius, header.eb = eb;
    header.vle_pardeg = pardeg;
    header.splen = splen;
    header.pred_type = config->pred_type;
    header.dtype = PszType<T>::type;
    // header.byte_vle = use_fallback_codec ? 8 : 4;
  };

  auto spline_in_use = [&]() { return config->pred_type == pszpred::Spline; };

  /* prediction-quantization with compaction */
  {
    if (spline_in_use()) {
#ifdef PSZ_USE_CUDA
      mem->od->dptr(in);
      spline_construct(
          mem->od, mem->ac, mem->e, (void*)mem->compact, eb, radius,
          &time_pred, stream);
#else
      throw runtime_error(
          "[psz::error] spline_construct not implemented other than CUDA.");
#endif
    }
    else {
      psz_comp_l23r<T, E>(
          in, len3, eb, radius, mem->ectrl(), (void*)mem->compact, &time_pred,
          stream);
    }

    if (spline_in_use()) {
      PSZDBG_LOG("interp: done");
      PSZDBG_PTR_WHERE(mem->ectrl());
      PSZDBG_VAR("pipeline", len);
    }
    if (spline_in_use())
    {PSZSANITIZE_QUANTCODE(mem->e->control({D2H})->hptr(), len, booklen);}
  }

  /* statistics: histogram */
  {
    PSZ_HIST(mem->ectrl(), len, mem->hist(), booklen, &time_hist, stream);
    // if (spline_in_use())
    // {PSZSANITIZE_HIST_OUTPUT(mem->ht->control({D2H})->hptr(), booklen);}
    if (spline_in_use()) { PSZDBG_LOG("histsp gpu: done"); }
  }

  /* Huffman encoding */
  {
    codec->build_codebook(mem->ht, booklen, stream);
    // [TODO] CR estimation must be after building codebook; need a flag.
    if (config->report_cr_est) {
      auto overhead = spline_in_use() ? sizeof(T) * mem->ac->len() : 0;
      codec->calculate_CR(mem->e, sizeof(T), overhead);
    }
    if (spline_in_use()) { PSZDBG_LOG("codebook: done"); }
    // if (spline_in_use()){PSZSANITIZE_HIST_BK(mem->ht->hptr(),
    // codec->bk4->hptr(), booklen);}
    codec->encode(mem->ectrl(), len, &d_codec_out, &codec_outlen, stream);
    if (spline_in_use()) { PSZDBG_LOG("encoding done"); }
  }

  /* make outlier count seen on host */
  {
    mem->compact->make_host_accessible((GpuStreamT)stream);
    splen = mem->compact->num_outliers();
  }

  /* update metadata/header */
  update_header();
  if (spline_in_use()) { PSZDBG_LOG("update header: done"); }

  /* memcpy to archive */
  merge_subfiles(
      config->pred_type,                                                     //
      mem->anchor(), mem->ac->len(),                                         //
      d_codec_out, codec_outlen,                                             //
      mem->compact_val(), mem->compact_idx(), mem->compact->num_outliers(),  //
      stream);
  if (spline_in_use()) { PSZDBG_LOG("merge buf: done"); }

  /* output of this function */
  outlen = psz_utils::filesize(&header);
  mem->_compressed->m->len = outlen;
  mem->_compressed->m->bytes = outlen;
  out = mem->_compressed->dptr();

  collect_comp_time();
  if (spline_in_use()) { PSZDBG_LOG("compression: done"); }

  return this;
}

template <class C>
Compressor<C>* Compressor<C>::merge_subfiles(
    pszpredictor_type pred_type, T* d_anchor, szt anchor_len,
    BYTE* d_codec_out, szt codec_outlen, T* d_spval, M* d_spidx, szt splen,
    void* stream)
#if defined(PSZ_USE_1API)
try
#endif
{

#if defined(PSZ_USE_1API)
  auto queue = (sycl::queue*)stream;
#endif

  uint32_t nbyte[Header::END];

  auto dst = [&](int FIELD, szt offset = 0) {
    return (void*)(mem->compressed() + header.entry[FIELD] + offset);
  };

#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
  auto concat_d2d = [&](int FIELD, void* src, u4 dst_offset = 0) {
    CHECK_GPU(GpuMemcpyAsync(
        dst(FIELD, dst_offset), src, nbyte[FIELD], GpuMemcpyD2D,
        (GpuStreamT)stream));
  };
#elif defined(PSZ_USE_1API)
  auto concat_d2d = [&](int FIELD, void* src, u4 dst_offset = 0) {
    queue->memcpy(dst(FIELD, dst_offset), src, nbyte[FIELD]);
  };
#endif

  // header.self_bytes = sizeof(Header);

  ////////////////////////////////////////////////////////////////
  nbyte[Header::HEADER] = sizeof(Header);
  nbyte[Header::VLE] = sizeof(BYTE) * codec_outlen;
  nbyte[Header::ANCHOR] = pred_type == Spline ? sizeof(T) * anchor_len : 0;
  nbyte[Header::SPFMT] = (sizeof(T) + sizeof(M)) * splen;

  header.entry[0] = 0;
  // *.END + 1; need to know the ending position
  for (auto i = 1; i < Header::END + 1; i++) header.entry[i] = nbyte[i - 1];
  for (auto i = 1; i < Header::END + 1; i++)
    header.entry[i] += header.entry[i - 1];

    // TODO no need to copy header to device
#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
  CHECK_GPU(GpuMemcpyAsync(
      dst(Header::HEADER), &header, nbyte[Header::HEADER], GpuMemcpyH2D,
      (GpuStreamT)stream));
#elif defined(PSZ_USE_1API)
  queue->memcpy(dst(Header::HEADER), &header, nbyte[Header::HEADER]);
#endif

  // copy anchor
  if (pred_type == pszpredictor_type::Spline)
    concat_d2d(Header::ANCHOR, d_anchor, 0);

  concat_d2d(Header::VLE, d_codec_out, 0);

  // [TODO] rework the wrapper
  // concat_d2d(Header::SPFMT, d_spval, 0);
  // concat_d2d(Header::SPFMT, d_spidx, sizeof(T) * splen);

#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
  CHECK_GPU(GpuMemcpyAsync(
      dst(Header::SPFMT, 0), d_spval, sizeof(T) * splen, GpuMemcpyD2D,
      (GpuStreamT)stream));
  CHECK_GPU(GpuMemcpyAsync(
      dst(Header::SPFMT, sizeof(T) * splen), d_spidx, sizeof(M) * splen,
      GpuMemcpyD2D, (GpuStreamT)stream));
  /* debug */ CHECK_GPU(GpuStreamSync(stream));
#elif defined(PSZ_USE_1API)
  queue->memcpy(dst(Header::SPFMT, 0), d_spval, sizeof(T) * splen);
  queue->memcpy(
      dst(Header::SPFMT, sizeof(T) * splen), d_spidx, sizeof(M) * splen);
  /* debug */ queue->wait();
#endif

  return this;
}
#if defined(PSZ_USE_1API)
catch (sycl::exception const& exc) {
  std::cerr << exc.what() << "Exception caught at file:" << __FILE__
            << ", line:" << __LINE__ << std::endl;
  std::exit(1);
}
#endif

template <class C>
Compressor<C>* Compressor<C>::dump(
    std::vector<pszmem_dump> list, char const* basename)
{
  for (auto& i : list) {
    char __[256];

    auto ofn = [&](char const* suffix) {
      strcpy(__, basename);
      strcat(__, suffix);
      return __;
    };

    // TODO check if compressed len updated
    if (i == PszArchive)
      mem->_compressed->control({D2H})->file(ofn(".psz_archive"), ToFile);
    else if (i == PszQuant)
      mem->e->control({D2H})->file(ofn(".psz_quant"), ToFile);
    else if (i == PszHist)
      mem->ht->control({D2H})->file(ofn(".psz_hist"), ToFile);
    else if (i > PszHf______ and i < END)
      codec->dump({i}, basename);
    else
      printf("[psz::dump] not a valid segment to dump.");
  }

  return this;
}

template <class C>
Compressor<C>* Compressor<C>::clear_buffer()
{
  codec->clear_buffer();
  mem->clear_buffer();
  return this;
}

template <class C>
Compressor<C>* Compressor<C>::decompress(
    cusz_header* header, BYTE* in, T* out, void* stream, bool dbg_print)
{
  // TODO host having copy of header when compressing
  if (not header) {
    header = new Header;
#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
    CHECK_GPU(GpuMemcpyAsync(
        header, in, sizeof(Header), GpuMemcpyD2H, (GpuStreamT)stream));
    CHECK_GPU(GpuStreamSync(stream));
#elif defined(PSZ_USE_1API)
    ((dpct::queue_ptr)stream)->memcpy(header, in, sizeof(Header));
    ((dpct::queue_ptr)stream)->wait();
#endif
  }

#if defined(PSZ_USE_CUDA) || defined(PSZ_USE_HIP)
  len3 = dim3(header->x, header->y, header->z);
#elif defined(PSZ_USE_1API)
  sycl::range<3> len3(header->z, header->y, header->x);
#endif

  // use_fallback_codec = header->byte_vle == 8;
  double const eb = header->eb;
  int const radius = header->radius;

  auto access = [&](int FIELD, szt offset_nbyte = 0) {
    return (void*)(in + header->entry[FIELD] + offset_nbyte);
  };

  // The inputs of components are from `compressed`.
  auto d_vle = (B*)access(Header::VLE);
  auto d_anchor = (T*)access(Header::ANCHOR);
  auto d_spval = (T*)access(Header::SPFMT);
  auto d_spidx = (M*)access(Header::SPFMT, header->splen * sizeof(T));

  // wire and aliasing
  auto d_space = out;
  auto d_xdata = out;

  psz::spv_scatter<PROPER_GPU_BACKEND, T, M>(
      d_spval, d_spidx, header->splen, d_space, &time_sp, stream);
  codec->decode(d_vle, mem->ectrl());

  if (header->pred_type == Spline) {
#ifdef PSZ_USE_CUDA
    mem->xd->dptr(out);

    // TODO release borrow
    auto aclen3 = mem->ac->template len3<dim3>();
    pszmem_cxx<T> anchor(aclen3.x, aclen3.y, aclen3.z);
    anchor.dptr(d_anchor);

    spline_reconstruct(
        &anchor, mem->e, mem->xd, eb, radius, &time_pred, stream);
#else
    throw runtime_error(
        "[psz::error] spline_reconstruct not implemented other than CUDA.");
#endif
  }
  else {
    psz_decomp_l23<T, E, FP>(
        mem->ectrl(), len3, d_space, eb, radius, d_xdata, &time_pred, stream);
  }

  collect_decomp_time();

  // clear state for the next decompression after reporting
  // use_fallback_codec = false;

  return this;
}

// public getter
template <class C>
Compressor<C>* Compressor<C>::export_header(cusz_header& ext_header)
{
  ext_header = header;
  return this;
}

template <class C>
Compressor<C>* Compressor<C>::export_header(cusz_header* ext_header)
{
  *ext_header = header;
  return this;
}

template <class C>
Compressor<C>* Compressor<C>::export_timerecord(TimeRecord* ext_timerecord)
{
  if (ext_timerecord) *ext_timerecord = timerecord;
  return this;
}

template <class C>
Compressor<C>* Compressor<C>::collect_comp_time()
{
#define COLLECT_TIME(NAME, TIME) \
  timerecord.push_back({const_cast<const char*>(NAME), TIME});

  if (not timerecord.empty()) timerecord.clear();

  COLLECT_TIME("predict", time_pred);
  COLLECT_TIME("histogram", time_hist);
  COLLECT_TIME("book", codec->time_book());
  COLLECT_TIME("huff-enc", codec->time_lossless());
  // COLLECT_TIME("outlier", time_sp);

  return this;
}

template <class C>
Compressor<C>* Compressor<C>::collect_decomp_time()
{
  if (not timerecord.empty()) timerecord.clear();

  COLLECT_TIME("outlier", time_sp);
  COLLECT_TIME("huff-dec", codec->time_lossless());
  COLLECT_TIME("predict", time_pred);

  return this;
}

}  // namespace cusz

#undef COLLECT_TIME

#endif /* A2519F0E_602B_4798_A8EF_9641123095D9 */
