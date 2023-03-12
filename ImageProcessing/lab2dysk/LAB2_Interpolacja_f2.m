clear;
clc;

% oś x
x = 0:0.1:6.28;

% funkcja interpolowana
y = sign(sin(8*x));

% ustalenie ilości węzłów na osi x
x_wezly = 0 : (2*pi)/4096 : (2*pi);

% Interpolacja
metoda{1}='spline';
metoda{2}='cubic';

for i=1:2
 y_interp=interp1(x,y,x_wezly,metoda{i});
 
% wyśwetlanie wykresów
subplot(2,1,i)
hold on;
axis([-0.2 6.5 -1.3 1.3]);

xlabel('x');
ylabel('f(x)');
plot(x,y,'g o', x_wezly,y_interp,'r', x_wezly, sign(sin(8*x_wezly)), 'b');

end

