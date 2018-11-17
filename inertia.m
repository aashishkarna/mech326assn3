% Calculates the Moment of Inertia based on the diameter of the shaft
function I = inertia(D)
    I = (pi/64)*D.^4;
end