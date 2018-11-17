%% Determines the factor of safety for yeild
% for the shaft.
% Inputs: d - diameter (m), M - Bending moment (Nm)
%         T - Torque (Nm).
function n = yeild(D, M, T)
% Initial Conditions
Sy = 390*(10^6); %Yeild Strength (Pa)
% Shaft Section
D = 33.8*10^(-3); %Diameter of shaft (m)
M = 159.1; %Bending (Nm)
T = 540; %Torque (Nm)

% Calculation of Stresses
sigma = (32*M)/(pi*(D^3));
tau = (16*T)/(pi*(D^3));

vonMises = sqrt((sigma^2) + 3*(tau^2));
n = Sy/vonMises;
end
