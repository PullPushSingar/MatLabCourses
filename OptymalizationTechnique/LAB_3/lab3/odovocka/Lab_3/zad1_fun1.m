%% f12(x)
format long;
fun = @(x) 2*x(1)^2 - 2*x(1)*x(2) + x(2)^2;

x0 = [2 6];

[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
z=2.*x.^2 - 2.*x.*y + y.^2;

figure(1)
contourf(x, y, z, 60);
grid on;
%options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-8, 'TolFun', 10e-8, 'Display', 'iter');
options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-3, 'TolFun', 10e-3, 'Display', 'iter');

[x,fval,exitflag,output] = fminsearch(fun, x0, options)

