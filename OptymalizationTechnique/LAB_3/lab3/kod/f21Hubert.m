format long;
a=5;
b=1;

fun = @(x) (b^2)*x(2)^4 - 2*b*x(1)*x(2)^2 + 2*x(1)^2 - 2*a*x(1) + a^2;


[xv, fvall, history] = his(x0);
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
z=(b^2)*y.^4 - 2*b*x.*y.^2 + 2*x.^2 - 2*a*x + a^2;


figure(1)
contourf(x, y, z, 100);
grid on;
hold on;
plot(history(1:size(history,1), 1), history(1:size(history, 1), 2), '--gs', 'MarkerSize', 5)

x0 = [4 2];

options = optimset('PlotFcns', @optimplotfval,'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');

[x,fval,exitflag,output,grad,hessian] = fminunc(fun, x0, options)