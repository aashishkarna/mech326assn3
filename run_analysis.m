%% Parameter Definition
clear; close all;

len_x = 0.6;                    % Length of the shaft (m)
x = linspace(0, len_x, 601);    % Location along the shaft (m)
E = 190e9;                      % Young's Module (Pa)
D = x2D(x);                     % Diameter of the shaft at each point x (m)

%% Generate Shear and Bending Moment Diagrams
do_plot = 0;    % Set to 1 to plot the diagrams
[y, theta, M_z, V_y, T, F] = gen_shear_bending(x, D, E, do_plot);

%% Check Deflection
if ~check_deflection(x, y, theta)
    print("Failed Deflection Check");
end

%% Check Yield

%% Check Fatigue