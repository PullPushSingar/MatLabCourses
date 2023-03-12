clear
format long;

% f1(x) Funkcja Engwall'a (funkcja minimalizacji)
fun = @(x) 2*x(1)^2 - 2*x(1)*x(2) + x(2)^2;

% punkt startowy
x0 = [4 8];

[xv, fvall, history] = his(x0);
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
z=2.*x.^2 - 2.*x.*y + y.^2;

figure(1)
contourf(x, y, z, 80);
grid on;
hold on;
plot(history(1:size(history,1), 1), history(1:size(history, 1), 2), '--gs', 'MarkerSize', 5)

% opcje optymalizacji
% TolX - tolerancja zakończenia na x, aktualny punkt
% TolFun - tolerancja zakończenia wartości funkcji
options = optimset('PlotFcns', @optimplotfval, 'TolX', 10e-8, 'TolFun', 10e-8);
%options = optimset('PlotFcns', @optimplotfval, 'TolX', 10e-3, 'TolFun', 10e-3);

[x,fval,exitflag,output] = fminsearch(fun, x0, options)
