function [y] = ftask1der(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y = (3*sin(x))/10 - 1/(x + 1) + (3*x*cos(x))/10;
end

