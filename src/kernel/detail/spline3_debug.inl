auto get_interp_order = [&](auto x, auto BI, auto GD, auto gx, auto gs, auto p1, auto p2, auto p3, auto p4, auto p5){
    T1 tmp_[4];
    int id_[4];
    
    bool case1 = (BI != GD - 1);
    bool case2 = (x >= 3 * unit);
    bool case3 = (x + 3 * unit <= BLOCK16);
    bool case4 = (gx + 3 * unit < gs);
    bool case5 = (gx + unit < gs);

    id_[0] = case2 ? x - 3 * unit : 0;
    
    id_[1] = x - unit;
    id_[1] = id_[1] >= 0 ? id_[1] : 0;

    id_[2] = x + unit;
    id_[2] = id_[2] <= 17 ? id_[2] : 0;
    
    id_[3] = x + 3 * unit;
    id_[3] = id_[3] <= 17 ? id_[3] : 0;

    tmp_[1] = s_data[z][x][id_[1]]; 
    pred = tmp_[1];
    tmp_[2] = s_data[z][x][id_[2]]; 
    pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
    tmp_[3] = s_data[z][x][id_[3]]; 

    pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
    tmp_[0] = s_data[z][x][id_[0]]; 
    pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
    
    pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-tmp_[0] + 9 * tmp_[1] + 9 * tmp_[2] - tmp_[3]) / 16 : pred;
    return pred
};

if(interpolator==0){
    if CONSTEXPR (BLUE) {  //
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIZ != GDZ - 1);
        bool case2 = (z >= 3 * unit);
        bool case3 = (z + 3 * unit <= BLOCK16);
        bool case4 = (global_z + 3 * unit < data_size.z);
        bool case5 = (global_z + unit < data_size.z);

        id_[0] = case2 ? z - 3 * unit : 0;
        
        id_[1] = z - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = z + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = z + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[id_[1]][y][x]; 
        pred = tmp_[1];
        tmp_[2] = s_data[id_[2]][y][x]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[id_[3]][y][x]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[id_[0]][y][x]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-tmp_[0] + 9 * tmp_[1] + 9 * tmp_[2] - tmp_[3]) / 16 : pred;
      
    
    }
    if CONSTEXPR (YELLOW) {  //
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIY != GDY - 1);
        bool case2 = (y >= 3 * unit);
        bool case3 = (y + 3 * unit <= BLOCK16);
        bool case4 = (global_y + 3 * unit < data_size.y);
        bool case5 = (global_y + unit < data_size.y);

        id_[0] = case2 ? y - 3 * unit : 0;
        
        id_[1] = y - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = y + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = y + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[z][id_[1]][x]; 
        pred = tmp_[1];
        tmp_[2] = s_data[z][id_[2]][x]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[z][id_[3]][x]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[z][id_[0]][x]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-tmp_[0] + 9 * tmp_[1] + 9 * tmp_[2] - tmp_[3]) / 16 : pred;
    }

    if CONSTEXPR (HOLLOW) {  //
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIX != GDX - 1);
        bool case2 = (x >= 3 * unit);
        bool case3 = (x + 3 * unit <= BLOCK16);
        bool case4 = (global_x + 3 * unit < data_size.x);
        bool case5 = (global_x + unit < data_size.x);

        id_[0] = case2 ? x - 3 * unit : 0;
        
        id_[1] = x - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = x + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = x + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[z][x][id_[1]]; 
        pred = tmp_[1];
        tmp_[2] = s_data[z][x][id_[2]]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[z][x][id_[3]]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[z][x][id_[0]]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-tmp_[0] + 9 * tmp_[1] + 9 * tmp_[2] - tmp_[3]) / 16 : pred;
    }

}
else{
    if CONSTEXPR (BLUE) {  //
        
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIZ != GDZ - 1);
        bool case2 = (z >= 3 * unit);
        bool case3 = (z + 3 * unit <= BLOCK16);
        bool case4 = (global_z + 3 * unit < data_size.z);
        bool case5 = (global_z + unit < data_size.z);

        id_[0] = case2 ? z - 3 * unit : 0;
        
        id_[1] = z - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = z + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = z + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[id_[1]][y][x]; 
        pred = tmp_[1];
        tmp_[2] = s_data[id_[2]][y][x]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[id_[3]][y][x]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[id_[0]][y][x]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-3 * tmp_[0] + 23 * tmp_[1] + 23 * tmp_[2] - 3 * tmp_[3]) / 40 : pred;
      
    }
    if CONSTEXPR (YELLOW) {  //
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIY != GDY - 1);
        bool case2 = (y >= 3 * unit);
        bool case3 = (y + 3 * unit <= BLOCK16);
        bool case4 = (global_y + 3 * unit < data_size.y);
        bool case5 = (global_y + unit < data_size.y);

        id_[0] = case2 ? y - 3 * unit : 0;
        
        id_[1] = y - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = y + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = y + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[z][id_[1]][x]; 
        pred = tmp_[1];
        tmp_[2] = s_data[z][id_[2]][x]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[z][id_[3]][x]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[z][id_[0]][x]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-3 * tmp_[0] + 23 * tmp_[1] + 23 * tmp_[2] - 3 * tmp_[3]) / 40 : pred;
    }

    if CONSTEXPR (HOLLOW) {  //
        T1 tmp_[4];
        int id_[4];
        
        bool case1 = (BIX != GDX - 1);
        bool case2 = (x >= 3 * unit);
        bool case3 = (x + 3 * unit <= BLOCK16);
        bool case4 = (global_x + 3 * unit < data_size.x);
        bool case5 = (global_x + unit < data_size.x);

        id_[0] = case2 ? x - 3 * unit : 0;
        
        id_[1] = x - unit;
        id_[1] = id_[1] >= 0 ? id_[1] : 0;

        id_[2] = x + unit;
        id_[2] = id_[2] <= 17 ? id_[2] : 0;
        
        id_[3] = x + 3 * unit;
        id_[3] = id_[3] <= 17 ? id_[3] : 0;
    
        tmp_[1] = s_data[z][x][id_[1]]; 
        pred = tmp_[1];
        tmp_[2] = s_data[z][x][id_[2]]; 
        pred = ((case1 && !case2 && !case3) || (!case1 && !case2 && !(case3 && case4) && case5)) ? (tmp_[1] + tmp_[2]) / 2 : pred;
        tmp_[3] = s_data[z][x][id_[3]]; 

        pred = ((case1 && !case2 && case3) || (!case1 && !case2 && case3 && case4)) ? (3*tmp_[1] + 6*tmp_[2]-tmp_[3]) / 8 : pred;
        tmp_[0] = s_data[z][x][id_[0]]; 
        pred = ((case1 && case2 && !case3) || (!case1 && case2 && !(case3 && case4) && case5)) ? (-tmp_[0]+6*tmp_[1] + 3*tmp_[2]) / 8 : pred;
        
        pred = ((case1 && case2 && case3) || (!case1 && case2 && case3 && case4)) ? (-3 * tmp_[0] + 23 * tmp_[1] + 23 * tmp_[2] - 3 * tmp_[3]) / 40 : pred;
    }
}