clear;
close all

a = 1;
h = 0.1;
c1 = 0;
funkcja = [];
funkcja(1) = c1; 
c2 = 1;
pochodna_funkcji = [];
pochodna_funkcji(1) = c2;
%metoda numeryczna
for i = 2:1:1000
 funkcja(i)= funkcja(i-1) + h * pochodna_funkcji(i-1); 
 pochodna_funkcji(i) = pochodna_funkcji(i-1) - h * a * funkcja(i);
end
t = 0:0.1:1000;
funkcja_analityczna = [];
pochodna_funkcji_analityczna = [];
% metoda analityczna
for i = 1:1:length(t)
 funkcja_analityczna(i) = sin(1/10*t(i));
 pochodna_funkcji_analityczna(i) = cos(1/10*t(i));
end
for i = 2:1:1000
 przebieg_bledu_sin(i) = funkcja(i) - sin(1/10*t(i));
 przebieg_bledu_cos(i) = pochodna_funkcji(i) - cos(1/10*t(i));
end
 
hold on
figure(1)
plot(funkcja,'r')
plot(pochodna_funkcji,'b')
xlabel('t');
ylabel('x(t)');
title('Metoda numeryczna');
legend('v_1(t) - funkcja','v_2(t) - pochodna funkcji');
grid on
figure(2)
hold on
plot(linspace(1,1000,length(t)), funkcja_analityczna, 'b');
plot(funkcja,'r')
title('Sinus');
xlabel('t');
ylabel('v_1(t)');
legend('Rozwiązanie analityczne','Rozwiązanie numeryczne')
grid on
figure(3)
hold on
plot(linspace(1,1000,length(t)), pochodna_funkcji_analityczna, 'b');
plot(pochodna_funkcji,'r')
title('Cosinus');
xlabel('t');
ylabel('v_2(t)');
legend('Rozwiązanie analityczne','Rozwiązanie numeryczne')
hold on

grid on
figure(4)
hold on
plot(przebieg_bledu_sin, 'r');
plot(przebieg_bledu_cos, 'b');
legend('v_1(t)', 'v_2(t)');
xlabel('t');
ylabel('x_n_u_m(t) - x_a_n(t)')
