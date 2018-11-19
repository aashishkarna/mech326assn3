function [nf] = fatigue (D, Sigma, x, shoulder_indices)
  Sut = 460e6;
  Se = 0.5*Sut;  % Se'
  
  % Marin Factors
  a = 4.51;
  b = -0.265;
  ka = a*(460)^b;
  
  kb = (1.51*(1000 * D).^(-0.157)).*(D>0.051)+(1.24*(1000 * D).^(-0.107)).*(D<=0.051);
  Se = Se * ka * kb;
  nf = Se ./ Sigma;
  nf = min(nf, 10);
  
  plot(x, nf);
  title('n\_fatigue');
  
  for i = shoulder_indices
    disp(['Shoulder fatigue safety factor of ', num2str(nf(i)), ' at x = ', num2str(x(i))])
  end
  [nf, i] = min(nf);
  disp(['Minimum fatigue safety factor of ', num2str(nf), ' at x = ', num2str(x(i))])
  disp('Divide n_fatigue by (0.3 + 0.7 * K_t)')
end
