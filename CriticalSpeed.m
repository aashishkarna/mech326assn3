%% Determines the Critical Speed of the Shaft
% Currently doesn't take shaft components into consideration
% Inputs:
% y - Function of xi for the deflections.
% rho - density of material
% sections - section boundary point indicies
% xj - location along shaft (m)
% dj - deflections along shaft (m)
% Uses: x2D function.
% Output:
%   critical speed in rev/min

function omega1 = CriticalSpeed(y, rho, sections, xj, dj)
    g = 9.81; %Gravitational Constant
    dxi = xj(2)-xj(1); %Evenly Distributed points
    sum_wjyj = 0;
    for j = 1:(length(sections)-1)
        d = dj(sections(j):(sections(j)+1));
        mi = (rho.*pi.*(d.^2).*dxi)./4;
        wi = mi;
        yi = y(sections(j):(sections(j)+1));
        sum_wjyj = sum_wjyj + sum(yi.*wi);
    end
    omega1 = sqrt((g*sum_wjyj)/(sum_wjyj)) * (60.0/(2*pi));
end

