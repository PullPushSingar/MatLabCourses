close all;
clear;

N = 1000000;

Xrandomvector = rand(N,1) * 2 -1;
YrandomVector = rand(N,1) * 2 - 1;


pointsInsideCryrcle = Xrandomvector.^2 + YrandomVector.^2 <=1;
pointsOutsideCryrcle = Xrandomvector.^2 + YrandomVector.^2 >1;

r=1;
th = 0:pi/N:2*pi;
xunit = r * cos(th);
yunit = r * sin(th);
plot(xunit, yunit,"Color",[0 0 0]);
hold on
plot(Xrandomvector(pointsInsideCryrcle),YrandomVector(pointsInsideCryrcle),"x","Color",[1 0 0]);
hold on
plot(Xrandomvector(pointsOutsideCryrcle),YrandomVector(pointsOutsideCryrcle),"x","Color",[0 1 0]);
axis equal;

result = 4*(sum(pointsInsideCryrcle)/N);


disp("wynik to :" + result)
