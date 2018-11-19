% Get the diameter at any point on the shaft
% input: x - Location along shaft (m)
% output: D - diameter at each location along the shaft (m)
function D = x2D(x)
    [m,n] = size(x);
    D = ones(1, n);
    
    % Standard bearing sizes available from Shigley's Table 11-2
    bearing1_d = 10;            % bore
    bearing1_w = 39;             % width
    bearing1_sh_d = 12.5;       % shoulder diameter d_s
    bearing1_sh_w = 10;          % shoulder width chosen (not in shigley)
    
    % Gear diameters selected from the same table
    gear1_d = 15;               
    gear1_w = 100;
    gear1_sh_w = 300;
    
    % Note: The shoulder for gear 1 is to be 7.5-20 mm greater than bore
    % diameter. However, this shoulder is also the bore diameter for
    % bearing 2, thus only specific values are permitted (from Table 11-2)
    bearing2_d = 25;
    bearing2_sh_d = 30;
    
    % Note: Same goes for gear 2. The shoulder is to be 7.5-20 mm greater
    % than bore diameter. In this case, the shoulder is the same as the
    % shoulder for bearing 2.
    gear2_d = 20;
    gear2_w = 100;
    gear2_sh_w = 25;            % shoulder width
    
    
% ------------------------------------------------------------------------    
    length = 0;
    length2 = length + bearing1_w;
    length3 = length2 + bearing1_sh_w;
    length4 = length3 + 1;
    length5 = length4 + gear1_w;
    length6 = length5 + gear1_sh_w;
    length7 = length6 + gear2_sh_w;
    length8 = length7 + gear2_w;
    length9 = length8 + 1;
    
    
    for i=1:n
        if i<=length2 && i>length
            D(i) = bearing1_d;
        end
         
        if i>length2 && i<=length3
            D(i) = bearing1_sh_d;
        end
          
        if i>length3 && i<=length4
            D(i) = bearing1_sh_d - 1;
        end

        if i>length4 && i<=length5
            D(i) = gear1_d;
        end

        if i>length5 && i<=length6
            D(i) = bearing2_d;
        end
 
        if i>length6 && i<=length7
            D(i) = bearing2_sh_d;
        end
        
        if i>length7 && i<=length8
            D(i) = gear2_d;
        end
        
        if i>length8 && i<=length9
            D(i) = gear2_d - 1;
        end
        
        if i>length9
            D(i) = gear2_d;
        end 
    end 
    D = D/1000;
end