clear;
close all;



line1 = animatedline;
teta_agree = 6;
teda_radian = deg2rad(teta_agree);
h = 0.01;
t = 0:h:25;
t_tength = length(t);

g = 9.91;
l = 1;
x = g/l;

v1 = zeros(1,t_tength);
a1 = zeros(1,t_tength);
v2 = zeros(1,t_tength);
a2 = zeros(1,t_tength);

v1(1) = 0;
v2(1) = 0;
a1(1) = 1;
a2(1) = 1;

for i = 2:t_tength
    v1(i) = v1(i-1) + tet*h*a1(i-1);
    a1(i) = a1(i-1) - tet*x*h*v1(i);
end

figure(1)
plot(t,a1);