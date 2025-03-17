#pragma unroll
for(int id_itr = 0; id_itr < 4; ++id_itr){
 tmp_1[id_itr] = s_data[id_1[id_itr]][y][x]; 
 tmp_2[id_itr] = s_data[z][id_2[id_itr]][x]; 
}

T1 pred_1[5], pred_2[5];
pred_2[0] = tmp_2[1];
pred_2[1] = cubic_interpolator(tmp_2[0],tmp_2[1],tmp_2[2],tmp_2[3]);
pred_2[2] = (-tmp_2[0]+6*tmp_2[1] + 3*tmp_2[2]) / 8;
pred_2[3] = (3*tmp_2[1] + 6*tmp_2[2]-tmp_2[3]) / 8;
pred_2[4] = (tmp_2[1] + tmp_2[2]) / 2;

pred_1[0] = tmp_1[1];
pred_1[1] = cubic_interpolator(tmp_1[0],tmp_1[1],tmp_1[2],tmp_1[3]);
pred_1[2] = (-tmp_1[0]+6*tmp_1[1] + 3*tmp_1[2]) / 8;
pred_1[3] = (3*tmp_1[1] + 6*tmp_1[2]-tmp_1[3]) / 8;
pred_1[4] = (tmp_1[1] + tmp_1[2]) / 2;

auto interp_1 = get_interp_order(x_1,BI_1,GD_1,gx_1,gs_1);
auto interp_2 = get_interp_order(x_2,BI_2,GD_2,gx_2,gs_2);

pred = pred_1[0] + pred_2[0] - s_data[z - unit][y - unit][x];
int case_num = interp_1 + interp_2 * 5;

pred = (interp_1 == 4 && interp_2 == 4) ?  (pred_2[1] +  pred_1[1]) / 2 : pred;

pred = (interp_1 != 4 && interp_2 == 4) ? pred_2[1] : pred;
pred = (interp_1 == 4 && interp_2 != 4) ? pred_1[1] : pred;

pred = (interp_1 == 3 && interp_2 == 3) ?  (pred_1[2] +  pred_2[2]) / 2 : pred;
pred = (interp_1 == 3 && interp_2 == 2) ?  (pred_1[2] +  pred_2[3]) / 2 : pred;
pred = (interp_1 == 3 && interp_2 < 2) ?  pred_1[2] : pred;

pred = (interp_1 == 2 && interp_2 == 3) ?  (pred_1[3] +  pred_2[2]) / 2 : pred;
pred = (interp_1 == 2 && interp_2 == 2) ?  (pred_1[3] +  pred_2[3]) / 2 : pred;
pred = (interp_1 == 2 && interp_2 < 2) ?  pred_1[3] : pred;

pred = (interp_1 <= 1 && interp_2 == 3) ?  pred_2[2] : pred;
pred = (interp_1 <= 1 && interp_2 == 2) ?  pred_2[3] : pred;
pred = (interp_1 == 1 && interp_2 == 1) ?  (pred_1[4] + pred_2[4]) / 2: pred;
pred = (interp_1 == 1 && interp_2 < 1) ?  pred_1[4] : pred;


pred = (interp_1 == 0 && interp_2 == 1) ?  pred_2[4]: pred;