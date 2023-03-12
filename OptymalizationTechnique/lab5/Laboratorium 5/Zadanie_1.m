clc;
clear;
close all;
format long;

[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
z = x.^2 + x.*y + 0.5.*y.^2 - x - y;

contourf(x, y, z, 50);
hold on

fun = @(x)  x(1)^2 + x(1)*x(2) + 0.5*x(2)^2 - x(1) - x(2);

xx = -10:0.1:10;
yy = xx + 7;
plot(xx, yy, 'r')
axis([-10 10 -10 10]);

options = optimoptions('fmincon', 'Display', 'iter', 'TolFun', 1e-5,...
    'TolX', 1e-5, 'TolCon', 1e-4, 'PlotFcns', @optimplotconstrviolation);

x0 = [-6, 6];
A  = [1.0,-1.0];
b  =  -7.0;

Aeq = [];
beq = [];

lb = [];
ub = [];

nonlcon = [];
[x, fval, exitflag, output] = fmincon(fun, x0, A, b, Aeq,...
    beq, lb, ub, nonlcon, options)

figure(1)
[xsol,fval,history,searchdir] = runfmincon;

figure(1)
hold on
plot(x(1), x(2), '*r');
plot(0.00000000, 0.99999998, 'ow');

g1tolcon = (x(1) - x(2) + 7)