function [nf] = fatigue (d, sigma, Kt)
  Sut = 460e6;
  Se = 0.5*Sut;  % Se'
  
  % Marin Factors
  a = 4.51;
  b = -0.265;
  ka = a*Sut^b;
  if d > 0.051
    kb = 1.51*(1000 * d)^(-0.157)
  else
    kb = 1.24*(1000 * d)^(-0.107)
  end
  Se = Se * ka * kb
  
  q = 0.7;  % Assumes 1 mm notch radius
  Kf = 1 + q * (Kt - 1);
  nf = Se / (Kf * sigma);
end
