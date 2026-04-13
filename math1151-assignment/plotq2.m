% Close previous figures
close all;  % (apparently this is a best practice for plotting)

% Declare anonymous function and interval
f = @(x) exp(-2.*x) + 8*cos(74*x);
xinterval = [0, pi/74];  % docs for fplot say xinterval is two-element vector [xmin, xmax]

% Plot a red-dotted line on the x-axis
fplot(0, xinterval, 'r--');
hold on;  % This ensures the function can be plotted too!

% Plotting the function itself
fplot(f, xinterval, 'b');  %fplot args are (anonymous func, xinterval[xmin, xmax])

% Circle the start and end points
plot(0, 9, 'ro');
plot(xinterval(2), f(xinterval(2)), 'ro');

% Some aesthetic stuff
grid on;
txt = "f(x) = e^{-2x} + 8cos(74x)";
title(txt);
xlabel('x'); ylabel('f(x)');