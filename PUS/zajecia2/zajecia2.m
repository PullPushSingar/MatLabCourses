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
title("Twew0 = f(qg0)");
xlabel("qg0")
ylabel("Twew0")
hold on;
grid on;

plot(qg0,Twew0);
plot(qgN,TwewN,'ro');

%legend

subplot(222)
title("Twew = f(Tzew)");
xlabel("Twew")
ylabel("Tzew")
hold on;
grid on;

plot(Tzew,Twew0);
plot(TzewN,TwewN,'ro');


subplot(223)
title("Tp = f(g)")
xlabel("Qg")
ylabel("Tp")
hold on;
grid on;

plot(qg0,Tp0);
plot(qgN,TpN,'ro');


subplot(224)
title("Tp = f(Tzew)")
xlabel("Tzw")
ylabel("Tw")
hold on;
grid on;

plot(Tzew,Tp0);
plot(TzewN,TpN,'ro');



end
legend

