clear;
close all;




teta_agree = 90;
teda_radian = deg2rad(teta_agree);
h = 0.01;
t = 0:h:25;
t_length = length(t);




l = 1;
g = 9.91;
x = g/l;

v1 = zeros(1,t_length);
a1 = zeros(1,t_length);
v2 = zeros(1,t_length);
a2 = zeros(1,t_length);
cos_func = zeros(1,t_length);

v1(1) = 0;
v2(1) = 0;
a1(1) = 1;
a2(1) = 1;

for i = 2:t_length
    v1(i) = v1(i-1) + teda_radian*h*a1(i-1);
    a1(i) = a1(i-1) - teda_radian*x*h*v1(i);
end

figure(1)
plot(t,a1);


for i = 2:t_length
    v2(i) = v2(i-1) + teda_radian*h*a2(i-1);
    a2(i) = a2(i-1) - sin(teda_radian)*h*x*v2(i);
end

figure(2);
plot(t,a2);

for i = 2:t_length
    cos_func(i) = cos(pi*t(i)*teda_radian);
end

figure(3);
plot(t,cos_func);

figure(4)

subplot(3,1,1);
plot(t,a1,"r");
title("Rozwiązanie zlinearyzowane");
xlabel("t")
ylabel("f(t)");
grid on;
subplot(3,1,2);
plot(t,a2,"b");
title("Rozwiązanie niezlinearyzowane");
xlabel("t")
ylabel("f(t)");
grid on;
subplot(3,1,3);
plot(t,cos_func,"g")
title("Rozwiązanie analityczne");
xlabel("t")
ylabel("f(t)");
grid on;


figure(5);
plot(t,a1,"r");
hold on
plot(t,a2,"b");
hold on;
plot(t,cos_func,"g");
title("Poszczególne rozwiązania przedsatwiona na jednym wykresie");
xlabel("t")
ylabel("f(t)");
legend("Rozwiązanie zlinearyzowane","Rozwiązanie niezlinearyzowane","Rozwiązanie analityczne")
grid on;