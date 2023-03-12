clear;
close all;
format long;

fun = @(x)  x(1)^2 + x(1)*x(2) + 0.5*x(2)^2 - x(1) - x(2);

x0 = [3,3];

[x1, x2] = meshgrid(-10:0.1:10, -10:0.1:10);
y =  x1.^2 + x1.*x2 + 0.5.*x2.^2 - x1 - x2;

contourf(x1,x2,y,50);

%options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');
%options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-3, 'TolFun', 10e-3,'Display','iter');
%[x,fval,exitflag,output] = fminsearch(fun, x0, options)


