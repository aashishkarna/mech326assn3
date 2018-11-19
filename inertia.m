% Calculates the Moment of Inertia based on the diameter of the shaft
function I = inertia(D, d)
    I = (pi/64)*(D.^4 - d.^4);
end