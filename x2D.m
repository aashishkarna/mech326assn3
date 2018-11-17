% Get the diameter at any point on the shaft
% input: x - Location along shaft (meters)
function D = x2D(x)
    D = ones(1, length(x));
    D(200:300) = 2 * D(200:300);
end