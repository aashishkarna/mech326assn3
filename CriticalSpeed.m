%% Determines the Critical Speeds of the Shaft
% Inputs:
% y - Function of xi for the deflections.
% rho - density of material
% xj - location along shaft (m)
% dj - deflections along shaft (m)
% din - inner shaft diameter (m)
% Uses: x2D function.
% Output:
%   omega1 - critical speed in rev/min from A to B
%   omega2 - critical speed in rev/min from B to right end of shaft

function [omega1, omega2] = CriticalSpeed(yj, rho, xj, dj, din)
    y = abs(yj);
    g = 9.81; %Gravitational Constant
    dxi = xj(2)-xj(1); %Evenly Distributed points
    Aind = x2ind(xj,0);
    Bind = x2ind(xj,0.45);
    Endind = length(xj);
        
    %Between bearings (A to B)
    dAB = dj(Aind:Bind);
    wAB = (rho.*pi.*(dAB.^2 - din.^2).*dxi)./4;
    yAB = y(Aind:Bind);

    %Add the shaft gears
    wj_G1 = (48.2/g);
    yj_G1 = y(x2ind(xj, 0.1));
    wj_G2 = (5.9/g);
    yj_G2 = y(x2ind(xj, 0.525));
    sum1_wjyj = sum(yAB.*wAB) + (yj_G1*wj_G1) + (yj_G2*wj_G2);
    sum1_wjyj2 = sum(wAB.*(yAB.^2)) + ((yj_G1^2)*wj_G1) + ((yj_G2^2)*wj_G2);
    omega1 = sqrt((g*sum1_wjyj)/(sum1_wjyj2)) * (60.0/(2*pi));
    
    %Bearing B to Free end
    dBFree = dj(Bind:Endind);
    wBFree = (rho.*pi.*(dBFree.^2 - din.^2).*dxi)./4;
    yBFree = y(Bind:Endind);
    
    sum2_wjyj = sum(yBFree.*wBFree);
    sum2_wjyj2 = sum(wBFree.*(yBFree.^2));
    omega2 = sqrt((g*sum2_wjyj)/(sum2_wjyj2)) * (60.0/(2*pi));
    
end

