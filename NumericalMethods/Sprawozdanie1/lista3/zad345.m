clear;
close all;


N = 10^7; %liczba próbek

Xrand = 2*rand(N,1) - 1; % losuje N współrzędnych X
Yrand = 2*rand(N,1) - 1; % losuje N współrzędnych Y
Zrand = 2*rand(N,1) - 1; % losuje N współrzędnych Z
p = 5; % norma
r = 1; %promien
X = linspace(-1,1,N);
th = linspace(0,2*pi,N);
V1 = (abs(Xrand).^p + abs(Yrand).^p + abs(Zrand).^p);
V2 = V1.^(1/p);


Vin = V2<=1;
Vout = V2>1;



plot3(Xrand(Vin),Yrand(Vin),Zrand(Vin),"X","Color",[0 0 1]);
hold on;
%plot3(Xrand(Vout),Yrand(Vout),Zrand(Vout),"X","Color",[1 1 1]);

counterIn = sum(Vin);
counterOut = N - counterIn;

surface = 2^3*counterIn/(counterOut+counterIn);
disp(surface);
%plot(Xrand,Vout,"O")
axis equal;