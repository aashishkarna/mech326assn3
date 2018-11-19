function [ m ] = mass( x, D, d , density)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

volume = 0; 
currentL= 0;
currentD= D(1); 

for i = 1:length(D)
    
    if currentD ~= D(i) || i == length(D)
        l = x(i) - currentL; 
        volume = volume + ((pi*(currentD/2)^2 - pi*(d/2)^2)*l);
        currentL = x(i); 
        currentD = D(i); 
    end
    

end

m = volume* density; 

end

