%% Parameter Definition
clear; close all;

len_x = 0.6;                    % Length of the shaft (m)
x = linspace(0, len_x, 601);    % Location along the shaft (m)
Sy = 390e6;                     % Yeild Strength (pa)
E = 190e9;                      % Young's Module (Pa)
D = x2D(x);                     % Diameter of the shaft at each point x (m)
d = 0.005;                      % Inner diameter of shaft (m)
RHO = 7870;                     % Density of shaft material (kg/m^3)
OPSpeed = 300;                  % Operational shaft rotation speed (rev/min) 
Ni = 10;                        % Number of discrete elements for critical speed analysis

%% Generate Shear and Bending Moment Diagrams
do_plot = 0;    % Set to 1 to plot the diagrams
[y, theta, M_z, V_y, T, F] = gen_shear_bending(x, D, d, E, do_plot);

%% Check Deflection
if ~check_deflection(x, y, theta)
    disp("Failed Deflection Check")
end

%% Check Yield
n_yield = yeild(D, d, M_z, T, Sy);
if(n_yield < 3)
   disp('Failed Yeild Check') 
end

%% Check Fatigue
sigma_rev = abs(M_z).*(D/2)./inertia(D, d);
n_fatigue = fatigue(D, sigma_rev, x, [100,]);
if(n_fatigue < 3)
   disp('Failed Fatige Check')
end

%% Check Critical Speed
[crit_speed1, crit_speed2] = CriticalSpeed(y, RHO, x, D, d);
if((crit_speed1*2) < OPSpeed && (crit_speed2*2) < OPSpeed)
   disp('Failed Critical Speed Check') 
end
