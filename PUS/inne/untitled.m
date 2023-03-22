cleal all;
close all;



%a0 = 5;
%a1 = 5 ;
%b  = 0;


czas_syulacji = 10;

t0 = 10;
u0 = 10;
du = 10;


x0 = 10;

[t] = sim('zajecia3.slx');

figure()
plot(t,x)