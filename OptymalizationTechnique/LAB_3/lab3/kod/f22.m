clear;

% f22(x)
fun = @(x) 2*x(1)^2 + 1.05*x(1)^4 - x(1)^6/6 + x(1)*x(2) + x(2)^2;

% punkt startowy
x0 = [2, 2.5];
%x0 = [-2.0, -2.7];


[x, y] = meshgrid(-4.0:0.1:4.0, -4.0:0.1:4.0);
z = 2.*x.^2 + 1.05.*x.^4 - x.^6./6 + x.*y + y.^2 ;

figure(1)
contourf(x, y, z, 100);
grid on;
hold on;


% opcje optymalizacji
% TolX - tolerancja zakończenia na x, aktualny punkt
% TolFun - tolerancja zakończenia wartości funkcji
options = optimset('PlotFcns', @optimplotfval, 'TolX', 10e-8, 'TolFun', 10e-8,'Display','iter');

[x,fval,exitflag,output,grad,hessian] = fminunc(fun, x0, options)
