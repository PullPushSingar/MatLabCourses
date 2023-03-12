close all
clear;
%a = 2 h = 0.01 , exp = 2.2
%a = 2 h = 0.01 , expr = 2.23
%a = 1 , h = 0.01 , ecp = 1.22
%a = 1 , h = 0.001 exp 1.22
% a = 1 , h = 0.01 , exp = 0.74
a = 1.0;
h = 0.01;
t = 0:h:10;
algrbraic_solve = zeros(1,length(t));
numeric_solve = zeros(1,length(t));
ox = linspace(0,3,length(t));
numeric_solve(1) = 1;


algebraic_numberic_subtraction = zeros(1,length(t));

for i = 1:length(t)
    algrbraic_solve(i) = exp( t(i));
end

figure(1)
plot(ox,algrbraic_solve,"b");
title("Rozwiązanie analityczne");
xlabel("x");
ylabel("f(x)")
grid on

figure(2)
for j = 2:length(numeric_solve)
    numeric_solve(j) = numeric_solve(j - 1) + h * a * numeric_solve(j - 1);
end


for i = 1:1:length(t) 
algebraic_numberic_subtraction(i) = algrbraic_solve(i) - numeric_solve(i);

end

figure(1)
plot(ox,algrbraic_solve,"b");
title("Rozwiązanie analityczne");
xlabel("x");
ylabel("f(x)")
grid on

figure(2)
stairs(ox,numeric_solve,"r");
title("Rozwiązanie numeryczne");
xlabel("x");
ylabel("f(x)")
grid on



figure(3)
plot(ox,algebraic_numberic_subtraction,"g");
title("Różnica rozwiązania analitycznego i numrycznego");
xlabel("x");
ylabel("f(x)")

grid on

figure(4)
plot(ox,algrbraic_solve,"g");
title("Rozwiązanie analityczne i numryczne na jednym wykresie");
xlabel("x");
ylabel("f(x)")
hold on;
stairs(ox,numeric_solve,"r");
grid on
legend("Rozwiazanie analityczne", "Rozwiazanie numeryczne")


    

