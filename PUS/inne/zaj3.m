clear all;
close all;



a0 = 5;
a1 = 5 ;
b  = 0;


czas_symulacji = 100;

t0 = 10;
u0 = 0;
du = 1;

x0 = b*u

x0 = 10;

[t] = sim("zajecia3.slx");

figure()
plot(t,x)