% GENEROWANIE RODZINY CHARAKTERYSTYK STATYCZNYCH - SZABLON
% ------------- -------------- -------------- ------------- --
clear; close all;


% --- I - identyfikacja ---
% wartosci nominalne
qgN = 10000;
TzewN = -20;
TwewN = 20;
TpN = 20;

% wspolczynnik 'a'
a = 0.25;

% identyfikacja parametrow statycznych
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN/(TwewN * (1 + a) - TzewN - a * TpN))  * (a * (TwewN - TpN))/(TpN -  TzewN);
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);


% --- II - charakterystyki statyczne ---
% charaketrystyka 1 - Twew (qg)
qg0 = linspace(0,qgN,5) ;
Tzew = linspace(TzewN,TwewN,5);
%Tzew = TzewN ; 

for i = 1:length(Tzew)

%
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew(i);
Tp0 = (Kcp*Tzew(i) + Kcwp * Twew0)/(Kcwp + Kcp);


subplot(221);
title("Twew = f(qg)");
xlabel("qg[W]")
ylabel("Twew[℃]")
hold on;
grid on;

plot(qg0,Twew0);

%legend

subplot(222)
title("Twew = f(Tzew)");
xlabel("Tzew[℃]")
ylabel("Twew[℃]")
hold on;
grid on;

plot(Tzew,Twew0);

end

qg0 = linspace(0,qgN,5) ;
Tzew = linspace(TzewN,TwewN,5);

for i = 1:length(qg0)

Twew0 = ((qg0(i)*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew;
Tp0 = (Kcp*Tzew + Kcwp * Twew0)/(Kcwp + Kcp);
subplot(223)
title("Tp = f(qg)")
xlabel("qg[W]")
ylabel("Tp[℃]")
hold on;
grid on;

plot(qg0,Tp0);

subplot(224)
title("Tp = f(Tzew)")
xlabel("Tzew[℃]")
ylabel("Tp[℃]")
hold on;
grid on;

plot(Tzew,Tp0);

end

subplot(221);
hold on;
grid on;
plot(qgN,TwewN,'ro');
legend ("Tzew = -20","Tzew = -10","Tzew = 0","Tzew = 10","Tzew = 20", "Punkt Nominalny")
subplot(222)
hold on;
grid on;
plot(TzewN,TwewN,'ro');
legend ("gq = 0","gq = 2500","gq = 5000","gq = 7500","gq = 10000","Punkt Nominalny")
subplot(223)
hold on;
grid on;
plot(qgN,TpN,'ro');
legend ("Tzew = -20","Tzew = -10","Tzew = 0","Tzew = 10","Tzew = 20", "Punkt Nominalny")
subplot(224)
plot(TzewN,TpN,'ro');
legend ("gq = 0","gq = 2500","gq = 5000","gq = 7500","gq = 10000" ,"Punkt Nominalny")

