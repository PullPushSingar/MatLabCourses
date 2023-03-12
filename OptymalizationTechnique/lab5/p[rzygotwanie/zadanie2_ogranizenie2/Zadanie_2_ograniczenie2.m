clc;
clear;
close all;
format long;

[x, y] = meshgrid(-5.0:0.1:5.0, -5.0:0.1:5.0);
z = 2.*x.^2 + 1.05.*x.^4 - x.^6./6 + x.*y + y.^2 ;
contourf(x, y, z, 100);
hold on

fun = @(x) 2*x(1)^2 + 1.05*x(1)^4 - x(1)^6/6 + x(1)*x(2) + x(2)^2;


xx = -5.0:0.1:5.0;
yy = -(xx.^2 + xx.*4 + 4);
plot(yy, xx, 'r')
axis([-5.0 5.0 -5.0 5.0])

xx2 = -12.0:0.1:3.0;
yy2 = -xx2 - 6;
plot(yy2, xx2, 'r')
axis([-5.0 5.0 -5.0 5.0])

options = optimoptions('fmincon', 'Display', 'iter', 'TolFun', 1e-5, 'TolX', 1e-5, 'TolCon', 1e-4, 'PlotFcns', @optimplotconstrviolation);

x0 = [-5.0, -5.0];

A = [];
b = [];

Aeq = [];
beq = [];

lb = [];
ub = [];

nonlcon = [];

[x, fval, exitflag, output] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, {@cons2, @cons22}, options)

figure(1)
[xsol,fval,history,searchdir] = runfmincon2;

figure(1)
hold on
scatter(x(1), x(2), 'r*')
plot(-1.74755233, 0.87377615, 'ow');
plot(1.74755233, - 0.87377615, 'ow');

g1tolcon = x(2) + x(1).^2 + x(1).*4 + 4
g2tolcon = -x(2) -x(1) - 6