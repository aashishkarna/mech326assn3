% Calculates J based on the diameter of the shaft
function J = inertia_J(D, d)
    J = (pi/32)*(D.^4-d.^4);
end