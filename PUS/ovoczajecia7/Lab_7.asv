clear all;
close all;

%% Dane
% Wartosci nominalne
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;
Tzad = TpN;

a = 6; b = 2;
c = 3; h = 3;

Vw = a*b*c;
Vp = 1/3 * a*b*h;

cp = 1000;
rop = 1.2;

% Czas wystąpienia skoku
t0 = 1000; 

% Czas symulacji
czas_symulacji = 3000;

% Wspolczynnik 'a'
a_wspol = 0.25;

% Parametry dynamiczne równania
Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;

% Parametry statyczne równania
Kcw = qgN/(TwewN*(1+a_wspol)-TzewN-a_wspol*TpN);
Kcp = (qgN*a_wspol*(TwewN-TpN))/((TwewN*(1+a_wspol)-TzewN-a_wspol*TpN)*(TpN-TzewN));
Kcwp = a_wspol*Kcw;

%% Główna pętla programu

% Warunki początkowe
qg0 = qgN;
Tzew0 = TzewN;
% Twew0 = TwewN;
% Tp0 = TpN;

% Punkt pracy
Twew0 = qg0*(Kcwp+Kcp)/(Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp) + Tzew0;
Tp0 = qg0*Kcwp/(Kcw*Kcwp+Kcw*Kcp+Kcwp*Kcp) + Tzew0;
% Tzew0 =(Tp0*(Kcp+Kcwp)-Twew0*Kcwp)/Kcp;
qg0 =Twew0*(Kcw+Kcwp)-Tp0*Kcwp-Kcw*((Tp0*(Kcp+Kcwp)-Twew0*Kcwp)/Kcp);

% Identyfikacja
K = 0.003;
Kp = (0.9*520)/(K*50);
Tp = 520;
tp = 3.33*50;
Ki = Kp/tp;
Ti = tp/Kp;

% Czas opóźnienia
t0x = 50;

% Zakłocenia
dTzad = 5;
dTzew = 0;
dqg = 0;
%dqg = 0.1 * qgN;
    
% Wywołanie symulacji
sim("symlab.slx");
    
% Wyniki
figure(1);
hold on;
subplot(211);
grid on; hold on;
plot(t, Tpm, '-', 'DisplayName', "Tpm");
subplot(212);
grid on; hold on;
plot(t, qgm, '-', 'DisplayName', "qgm");
subplot(211);
grid on; hold on;
plot(t, Tpo, '-', 'DisplayName', "Tpo");
subplot(212);
grid on; hold on;
plot(t, qgo, '-', 'DisplayName', "qgo");

%% Opis wykresow, legendy
figure(1)
subplot(211);
xlabel('t');
ylabel('Tp'); 
title("Tp(t)");
legend(Location="southeast");
subplot(212);
xlabel('t');
ylabel('qg'); 
title("qg(t)");
legend(Location="southeast");