%% Parameter Definition
clear; close all;

len_x = 0.6;                    % Length of the shaft (m)
x = linspace(0, len_x, 601);    % Location along the shaft (m)
Sy = 390e6;                     % Yeild Strength (pa)
E = 190e9;                      % Young's Module (Pa)
D = x2D(x);                     % Diameter of the shaft at each point x (m)
RHO = 7870;                     % Density of shaft material (kg/m^3)
OPSpeed = 300;                  % Operational shaft rotation speed (rev/min) 
Ni = 10;                        % Number of discrete elements for critical speed analysis

%% Generate Shear and Bending Moment Diagrams
do_plot = 0;    % Set to 1 to plot the diagrams
[y, theta, M_z, V_y, T, F] = gen_shear_bending(x, D, E, do_plot);

%% Check Deflection
if ~check_deflection(x, y, theta)
    disp("Failed Deflection Check")
end

%% Check Yield
n_yield = yeild(D, M_z, T, Sy);
if(n_yield < 3)
   disp('Failed Yeild Check') 
end

%% Check Fatigue
% Need max_stress and K_t at point of max stress
% n_fatigue = fatigue(D, max_stress, K_t);
n_fatigue = 0;
if(n_fatigue < 3)
   disp('Failed Fatige Check')
end

%% Check Critical Speed
%NEED sections : a list of indices where the shaft diameter changes size.
sections = [1, 100, 200, 300, 400, 600];
crit_speed = CriticalSpeed(y, RHO, sections, x, D);
if(crit_speed < OPSpeed)
   disp('Operational speed above critical speed!') 
end
