T1 pred_y[5], pred_x[5];
pred_x[0] = tmp_x[1];
pred_x[1] = cubic_interpolator(tmp_x[0],tmp_x[1],tmp_x[2],tmp_x[3]);
pred_x[2] = (-tmp_x[0]+6*tmp_x[1] + 3*tmp_x[2]) / 8;
pred_x[3] = (3*tmp_x[1] + 6*tmp_x[2]-tmp_x[3]) / 8;
pred_x[4] = (tmp_x[1] + tmp_x[2]) / 2;

pred_y[0] = tmp_y[1];
pred_y[1] = cubic_interpolator(tmp_y[0],tmp_y[1],tmp_y[2],tmp_y[3]);
pred_y[2] = (-tmp_y[0]+6*tmp_y[1] + 3*tmp_y[2]) / 8;
pred_y[3] = (3*tmp_y[1] + 6*tmp_y[2]-tmp_y[3]) / 8;
pred_y[4] = (tmp_y[1] + tmp_y[2]) / 2;

auto interp_y = get_interp_order(y,BIY,GDY,global_y,data_size.y);
auto interp_x = get_interp_order(x,BIX,GDX,global_x,data_size.x);

T1 pred = 0;
pred += (interp_y == 4) * pred_y[1] + 
        (interp_x == 4) * pred_x[1] + 
        (interp_y == 3 && interp_x == 3);
int case_num = interp_y + interp_x * 5;

pred = (case_num % 5 == 4 && case_num / 5 == 4) ?  (pred_x[1] +  pred_y[1]) / 2 : pred;

pred = (case_num % 5 != 4 && case_num / 5 == 4) ? pred_x[1] : pred;
pred = (case_num % 5 == 4 && case_num / 5 != 4) ? pred_y[1] : pred;

pred = (case_num % 5 == 3 && case_num / 5 == 3) ?  (pred_y[2] +  pred_x[2]) / 2 : pred;
pred = (case_num % 5 == 3 && case_num / 5 == 2) ?  (pred_y[2] +  pred_x[3]) / 2 : pred;
pred = (case_num % 5 == 3 && case_num / 5 < 2) ?  pred_y[2] : pred;

pred = (case_num % 5 == 2 && case_num / 5 == 3) ?  (pred_y[3] +  pred_x[2]) / 2 : pred;
pred = (case_num % 5 == 2 && case_num / 5 == 2) ?  (pred_y[3] +  pred_x[3]) / 2 : pred;
pred = (case_num % 5 == 2 && case_num / 5 < 2) ?  pred_y[3] : pred;

pred = (case_num % 5 <= 1 && case_num / 5 == 3) ?  pred_x[2] : pred;
pred = (case_num % 5 <= 1 && case_num / 5 == 2) ?  pred_x[3] : pred;
pred = (case_num % 5 == 1 && case_num / 5 == 1) ?  (pred_y[4] + pred_x[4]) / 2: pred;
pred = (case_num % 5 == 1 && case_num / 5 < 1) ?  pred_y[4] : pred;


pred = (case_num % 5 == 0 && case_num / 5 == 1) ?  pred_x[4]: pred;
pred = (case_num % 5 == 0 && case_num / 5 < 1) ?  pred_y[0] + pred_x[0] - s_data[z][y - unit][x - unit]: pred;
