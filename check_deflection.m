% Ensure that deflection is permissible
function [did_pass] = check_deflection(x, y, theta)
    did_pass = 1;
    max_slope = 0.003; % Max slope at bearings (rad)
    max_deflectL = 0.01*0.0254;   % Max deflection at left spur, (m)
    max_deflectR = 0.5*0.01*0.0254;   % Max deflection at right worm, (m)
    
    % Get indices of gears and bearings
    ind_G1 = x2ind(x, 0.1);
    ind_G2 = x2ind(x, 0.525);
    ind_B1 = x2ind(x, 0);
    ind_B2 = x2ind(x, 0.45);
    
    if abs(y(ind_G1)) > max_deflectL
        did_pass = 0;
    end
    if abs(y(ind_G2)) > max_deflectR
        did_pass = 0;
    end
    if abs(theta(ind_B1)) > max_slope
        did_pass = 0;
    end
    if abs(theta(ind_B2)) > max_slope
        did_pass = 0;
    end
end