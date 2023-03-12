clear;
close all;


N = 10^7; %liczba próbek

Xrand = 2*rand(N,1) - 1; % losuje N współrzędnych X
Yrand = 2*rand(N,1) - 1; % losuje N współrzędnych Y
p = 4; % norma
r = 1; %promien
X = linspace(-1,1,N);

V1 = (abs(Xrand).^p + abs(Yrand).^p);
V2 = V1.^(1/p);

Vcricle = (abs(r).^p + abs(r).^p).^(1/p); 

Vin = V2<=1;
Vout = V2>1;

counterIn = 0;

plot(Xrand(Vin),Yrand(Vin),"X","Color",[1 1 0]);
hold on;
plot(Xrand(Vout),Yrand(Vout),"X","Color",[1 0 1]);

counterIn = sum(Vin);
counterOut = N - counterIn;

surface = 4*counterIn/(counterOut+counterIn);

disp(surface)
axis equal;