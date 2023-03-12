clear;
clc;

% oś czasu
t = 0.1 : 0.4 : (2*pi);

% funkcja interpolowana
x = sign(sin(8*t))';

ts = linspace(0,(2*pi),100);

% ndgrid replikuje wektory siatki, x1,x2,...,xn aby utworzyć n-pełnowymiarową siatkę
[Ts,T] = ndgrid(ts,t);

dt = 0.4;
y = sinc((Ts - T)/dt)*x;

b = 0:(2*pi)/4096:(2*pi);
a = sign(sin(8*b));

figure(1)
plot(t,x,'go',ts,y,'r');
hold on;

plot(b,a,'b');
hold on;

axis([-0.2 6.5 -1.3 1.3]);
xlabel('x');
ylabel('f(x)');
