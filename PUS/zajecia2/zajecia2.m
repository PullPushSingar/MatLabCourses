% GENEROWANIE RODZINY CHARAKTERYSTYK STATYCZNYCH - SZABLON
% ------------- -------------- -------------- ------------- --
clear; close all;


% --- I - identyfikacja ---
% wartosci nominalne
qgN = 10000;
TzewN = -20;
TwewN = 20;
TpN = 10;

% wspolczynnik 'a'
a = 0.25;

% identyfikacja parametrow statycznych
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN/(TwewN * (1 + a) - TzewN - a * TpN))  * (a * (TwewN - TpN))/(TpN -  TzewN);
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);


% --- II - charakterystyki statyczne ---
% charaketrystyka 1 - Twew (qg)
qg0 = 0:0.1* qgN : qgN ;
Tzew = linspace(TzewN,TwewN,length(qg0));
%Tzew = TzewN ; 

for i = 1:length(qg0)

%
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew(i);
Tp0 = (Kcp*Tzew(i) + Kcwp * Twew0)/(Kcwp + Kcp);


subplot(221);
title("Twew = f(qg)");
xlabel("qg")
ylabel("Twew")
hold on;
grid on;

plot(qg0,Twew0);

%legend

subplot(222)
title("Twew = f(Tzew)");
xlabel("Twew")
ylabel("Tzew")
hold on;
grid on;

plot(Tzew,Twew0);

subplot(223)
title("Tp = f(qg)")
xlabel("qg")
ylabel("Tp")
hold on;
grid on;

plot(qg0,Tp0);

subplot(224)
title("Tp = f(Tzew)")
xlabel("Tzw")
ylabel("Tw")
hold on;
grid on;

plot(Tzew,Tp0);

end

subplot(221);
hold on;
grid on;
plot(qgN,TwewN,'ro');
legend ("gq = 0","gq = 1000","gq = 2000","gq = 3000","gq = 4000", ...
    "gq = 5000","gq = 6000","gq = 7000","gq = 8000","gq = 9000","gq = 10000","Punkt Nominalny")
subplot(222)
hold on;
grid on;
plot(TzewN,TwewN,'ro');
legend ("Tzew = -20","Tzew = -16","Tzew = -12","Tzew = -8","Tzew = -4", ...
    "Tzew = 0","Tzew = 4","Tzew = 8","Tzew = 12","Tzew = 16","Tzew = 20","Punkt Nominalny")
subplot(223)
hold on;
grid on;
plot(qgN,TpN,'ro');
legend ("gq = 0","gq = 1000","gq = 2000","gq = 3000","gq = 4000", ...
    "gq = 5000","gq = 6000","gq = 7000","gq = 8000","gq = 9000","gq = 10000","Punkt Nominalny")
subplot(224)
plot(TzewN,TpN,'ro');
legend ("Tzew = -20","Tzew = -16","Tzew = -12","Tzew = -8","Tzew = -4", ...
    "Tzew = 0","Tzew = 4","Tzew = 8","Tzew = 12","Tzew = 16","Tzew = 20","Punkt Nominalny")
