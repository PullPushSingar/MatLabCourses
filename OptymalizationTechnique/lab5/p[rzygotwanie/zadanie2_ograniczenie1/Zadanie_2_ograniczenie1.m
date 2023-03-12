clc;
clear;
close all;
format long;

[x, y] = meshgrid(-5.0:0.1:5.0, -5.0:0.1:5.0);
z = 2.*x.^2-1.05.*x.^4+x.^6/6+x.*y+y.^2;
contourf(x, y, z, 100);
hold on

fun =@(x) 2*x(1)^2-1.05*x(1)^4+x(1)^6/6+x(1)*x(2)+x(2)^2;

xx = -5.0:0.1:5.0;
yy = 9 + xx.^2 - xx.*6;
plot(yy, xx, 'r');
axis([-5.0 5.0 -5.0 5.0]);

xx2 = -5.0:0.1:5.0;
yy2 = 0.5 + xx2.^3;
plot(xx2, yy2, 'r');
axis([-5.0 5.0 -5.0 5.0]);

options = optimoptions('fmincon', 'Display', 'iter', 'TolFun', 1e-5, 'TolX', 1e-5, 'TolCon', 1e-4, 'PlotFcns', @optimplotconstrviolation);

x0 = [1.0, 3.5];
A = [];
b = [];

Aeq = [];
beq = [];

lb = [];
ub = [];

nonlcon = [];
[x, fval, exitflag, output] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, @cons1, options);

figure(1)
[xsol,fval,history,searchdir] = runfmincon1;

figure(1)
hold on
scatter(x(1),x(2),'r*');
plot(-1.74755233, 0.87377615, 'ow');
plot(1.74755233, - 0.87377615, 'ow');

g1tolcon = -x(1) + (x(2)- 3).^2
g2tolcon = -x(2) + x(1).^3 + 0.5