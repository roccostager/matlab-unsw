% Close previous figures (apparently this is best practice for plotting)
close all;

% Declare anonymous function and interval
f = @(x) exp(-2.*x) + 8*cos(74*x);
xinterval = [0, pi/74];  % docs for fplot say xinterval is two-element vector [xmin, xmax]

fplot(f, xinterval);  %fplot args are (anonymous func, xinterval[xmin, xmax])
grid on;

txt = "f(x) = e^{-2x} + 8cos(74x)";
title(txt);