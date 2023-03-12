clear;

% f22(x)
fun = @(x) 2*x(1)^2 + 4*x(1)*x(2)^3 - 10*x(1)*x(2) + x(2)^2;

% punkt startowy
x0 = [2.0, 2.7];
%x0 = [-2.0, -2.7];

[xv, fvall, history] = his(x0);
[x, y] = meshgrid(-3.0:0.1:3.0, -3.0:0.1:3.0);
z = 2*x.^2 + 4*x.*y.^3 - 10*x.*y + y.^2;

figure(1)
contourf(x, y, z, 100);
grid on;
hold on;
plot(history(1:size(history,1), 1), history(1:size(history, 1), 2), '--gs', 'MarkerSize', 5)

% opcje optymalizacji
% TolX - tolerancja zakończenia na x, aktualny punkt
% TolFun - tolerancja zakończenia wartości funkcji
options = optimset('PlotFcns', @optimplotfval, 'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');

[x,fval,exitflag,output,grad,hessian] = fminunc(fun, x0, options)
