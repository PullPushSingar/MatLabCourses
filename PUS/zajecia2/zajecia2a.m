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
Tzew = TzewN ; 



%
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew;
Tp0 = (Kcp*Tzew + Kcwp * Twew0)/(Kcwp + Kcp);

mnoznik = 0:0.2:1;

figure()
subplot(221);
title("Twew0 = f(qg0)");
xlabel("qg0")
ylabel("Twew0")
hold on;
grid on;
for i = 1:length(mnoznik)
plot(mnoznik(i)*qg0,mnoznik(i)*Twew0);
plot(mnoznik(i)*qgN,mnoznik(i)*TwewN,'ro');
end
%legend

subplot(222)
title("qg0 = f(Twew0)");
xlabel("Twew0")
ylabel("qg0")
hold on;
grid on;
for i = 1:length(mnoznik)
plot(mnoznik(i)*Twew0,mnoznik(i)*qg0);
plot(mnoznik(i)*TwewN,mnoznik(i)*qgN,'ro');
end

subplot(223)
title("Tp = f(g)")
xlabel("Qg")
ylabel("Tp")
hold on;
grid on;
for i = 1 :length(mnoznik)
plot(mnoznik(i)*qg0,mnoznik(i)*Tp0);
plot(mnoznik(i)*qgN,mnoznik(i)*TpN,'ro');
end

subplot(224)
title("Qg = f(Tp)")
xlabel("Tp")
ylabel("Qg")
hold on;
grid on;
for i = 1:length(mnoznik)
plot(mnoznik(i)*Tp0,mnoznik(i)*qg0);
plot(mnoznik(i)*TpN,mnoznik(i)*qgN,'ro');
end

