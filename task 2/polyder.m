function [derivative] = polyder(polynomial)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

degree = length(polynomial) - 1;
derivative = zeros(1, degree);

for i = 1:1:degree
    derivative(i) = polynomial(i) * (degree - i + 1);
end

