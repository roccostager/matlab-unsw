% Harry's method for least squares

x = [1; 1; 1]  % x Coefficients
y = [1; 1; 1]  % y Coefficients

polyfit(x, y, 1)  % last param = degree
% Output of polyfit is REVERSED

A = [ones(size(x)) x x.^2];  % Quickly construct A matrix (syntactic sugar)