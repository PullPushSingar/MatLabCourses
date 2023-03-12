clc;
clear;
close all;
format long;

[x, y] = meshgrid(-3.0:0.1:3.0, -3.0:0.1:3.0);
z = 2*x.^2 + 4*x.*y.^3 - 10*x.*y + y.^2;
contourf(x, y, z, 100);
hold on

fun = @(x) 2*x(1)^2 + 4*x(1)*x(2)^3 - 10*x(1)*x(2) + x(2)^2;

xx = -3.0:0.1:3.0;
yy = 9 + xx.^2 - xx.*6;
plot(yy, xx, 'r');
axis([-3.0 3.0 -3.0 3.0]);

xx2 = -3.0:0.1:3.0;
yy2 = 0.5 + xx2.^3;
plot(xx2, yy2, 'r');
axis([-3.0 3.0 -3.0 3.0]);

options = optimoptions('fmincon', 'Display', 'iter', 'TolFun', 1e-5, 'TolX', 1e-5, 'TolCon', 1e-4, 'PlotFcns', @optimplotconstrviolation);

x0 = [2.0, 0.0];
A = [];
b = [];

Aeq = [];
beq = [];

lb = [];
ub = [];

nonlcon = [];
[x, fval, exitflag, output] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, @cons1, options)

figure(1)
[xsol,fval,history,searchdir] = runfmincon1;

figure(1)
hold on
scatter(x(1),x(2),'r*');
plot(1.5137969, 0.85948015, 'ow');
plot(-1.5137969, -0.85948015, 'ow');

g1tolcon = -x(1) + (x(2)- 3).^2
g2tolcon = -x(2) + x(1).^3 + 0.5