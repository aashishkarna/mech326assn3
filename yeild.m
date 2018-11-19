%% Determines the factor of safety for yeild for the shaft at a point.
% Inputs: D - diameter (m), M - Bending moment (Nm)
%         T - Torque (Nm), Sy - Yeild Strength (Pa)
function n = yeild(D, d, M, T, Sy)
%sigma = (32.*M)./(pi.*(D.^3));
sigma = M.*(D/2)./inertia(D,d);
%tau = (16.*T)./(pi.*(D.^3));
tau = T.*(D/2)./inertia_J(D,d);
vonMises = sqrt((sigma.^2) + 3.*(tau.^2));

n = Sy./vonMises;
end
