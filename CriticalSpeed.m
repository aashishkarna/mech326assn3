%%
% Inputs:
% yji - matrix of deflections
%      -> each row is the deflections for each slice in the section
% rho - density of material
% xj - section boundary points
% dj - diameters between xi's
% Ni - Number of elements for each section (j) (integer)

function omega1 = CriticalSpeed(yji, rho, xj, dj, Ni)
    g = 9.81; %Gravitational Constant
    sum_wjyj = 0;
    for j = 1:5
        d = dj(j);
        ti = linspace(xj(j), xj(j+1), Ni);
        mi = (rho*pi*(d^2)*ti)/4;
        wi = g*mi;
        yi = yji(j,:);
        sum_wjyj = sum_wjyj + sum(yi.*wi); 
    end
    omega1 = sqrt((g*sum_wjyj)/(sum_wjyj));

end

