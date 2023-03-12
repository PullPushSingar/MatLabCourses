clear;

% f22(x)
fun = @(x) 4*x(1)^2 + 2.1*x(1)^4 - x(1)^6/3 + 4*x(2)^4 + 4*x(2)^2;

% punkt startowy
x0 = [0, 0];
%x0 = [-2.0, -2.7];

[xv, fvall, history] = his(x0);
[x, y] = meshgrid(-4.0:0.1:4.0, -4.0:0.1:4.0);
z = 4.*x.^2 + 2.1.*x.^4 - x.^6/3 + 4.*y.^4 + 4.*y.^2 ;

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
