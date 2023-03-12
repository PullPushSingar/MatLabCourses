%% f21(x)
format long;
a=6;
b=4;

fun = @(x) (b^2)*x(2)^4 - 2*b*x(1)*x(2)^2 + 2*x(1)^2 - 2*a*x(1) + a^2;

[x, y] = meshgrid(-1:0.1:7, -2:0.1:2);
z=(b^2)*y.^4 - 2*b*x.*y.^2 + 2*x.^2 - 2*a*x + a^2;
figure(1)
contourf(x, y, z, 60);

x0 = [4 2];

options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');

[x,fval,exitflag,output,grad,hessian] = fminunc(fun, x0, options)
