clear all;
close all;





%259550

a0 = 5;
a1 = 5;
b = 9;

t_finish = 100;



figure()
 %Zad 1


    
 %   t0 = 10;
 %   u0 = 0;
 %   du = 1;
 %   x0 = b*u0/a0;


%zad 2

    %t0 = 10;
    %u0 = 20;
    %du = 40;
    %x0 = b*u0/a0;


%zad 3


%    t0 = 10;
%    u0 = 20;
%    du = 40;
%    x0 = 45;



%zad 4

    t0 = 10;
    u0 = 20;
    du = 0;
    x0 = b*u0/a0;



[t] = sim("Zajecia3Termin2\Simulink.slx");


plot(t,x);
title ("Rozwiązanie rówania różniczkowego")
xlabel("t")
ylabel("x")
