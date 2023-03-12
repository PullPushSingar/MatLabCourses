clear;
close all;
format long;

fun = @(x) x(1)^2 + x(1)*x(2) + 0.5*x(2)^2 - x(1) - x(2);

x0 = [3 3];

%[xv, fvall, history] = his(x0);
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
z =  x.^2 + x.*y + 0.5.*y.^2 - x - y;


figure(1)
contourf(x,y,z,50);
grid on;
hold on;
%plot(history(1:size(history,1), 1), history(1:size(history, 1), 2), '--gs', 'MarkerSize', 5)
options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-3, 'TolFun', 10e-3,'Display','iter');

%options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');

[x,fval,exitflag,output] = fminsearch(fun, x0, options)