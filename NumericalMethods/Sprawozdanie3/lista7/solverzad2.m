clear;
close all;

a = 1;
h = 0.0001;
ox = 0:h:100;
d0 = 0;
div_func = zeros(1,length(ox));
div_func(1) = d0;
d1 = 1;
func = zeros(1,length(ox));
func(1) = d1;

orginal_func = zeros(1,length(ox));
orginal_div_func = zeros(1,length(ox));


numeric_algebraic_subtraction_func = zeros(1,length(ox));
numeric_algebraic_subtraction_div = zeros(1,length(ox));


for i = 2:1:length(ox)
    func(i) = (func(i - 1) + h * div_func(i - 1));
    div_func(i) = div_func(i - 1) - h * a * func(i);
    
    
    
end

for j = 1:length(ox)
    orginal_div_func(j) = -sin(ox(j));
    orginal_func(j) = cos(ox(j));
end
n = 3;
while n <= length(orginal_func)
      numeric_algebraic_subtraction_div(n) = orginal_div_func(n) - div_func(n);
      numeric_algebraic_subtraction_func(n) = orginal_func(n) - func(n);
      n = n + 1;
end

figure(1)
subplot(2,1,1)
plot(ox,numeric_algebraic_subtraction_div,"r");
title("Różnica rozwiązania analitycznego i numerycznego Pochodna");
xlabel("x");
ylabel("f(x)")
grid on

subplot(2,1,2)
plot(ox,numeric_algebraic_subtraction_func,"b");
title("Różnica rozwiązania analitycznego i numerycznego funkcja");
xlabel("x");
ylabel("f(x)")
grid on;


figure(2)
subplot(2,1,1)
plot(ox,orginal_div_func,"r");
title("Rozwiązanie analityczne pochodna funkcji");
xlabel("x");
ylabel("f(x)")
grid on;

subplot(2,1,2)
plot(ox,orginal_func,"b");
title("Rozwiązanie analityczne funkcja");
xlabel("x");
ylabel("f(x)")
grid on;


figure(3)
subplot(2,1,1)
stairs(ox,div_func,"r");
title("Rozwiązanie numeryczne pochodna");
xlabel("x");
ylabel("f(x)")
grid on

subplot(2,1,2)
stairs(ox,func,"b");
title("Rozwiązanie numeryczne funkcja");
xlabel("x");
ylabel("f(x)")
grid on


figure(4)
subplot(2,1,1)
plot(ox,orginal_div_func,"r");
hold on
stairs(ox,div_func,"b");
hold on;
title("Rozwiązanie analityczne i numeryczne na jednym wykresie pochodna ")
xlabel("x");
ylabel("f(x)")
legend("Rozwiazanie analityczne", "Rozwiazanie numeryczne")
grid on

subplot(2,1,2)
plot(ox,orginal_func,"r");
hold on;
stairs(ox,func,"b");
title("Rozwiązanie analityczne i numeryczne na jednym wykresie funkcja ")
xlabel("x");
ylabel("f(x)")
legend("Rozwiazanie analityczne", "Rozwiazanie numeryczne")
grid on