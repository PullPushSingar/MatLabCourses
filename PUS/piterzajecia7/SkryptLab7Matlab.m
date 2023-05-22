clear;
close all; 

%% Identyfikacja parametrow 
% Definicje Wartosc Nominalnych 
TzewN = -20; % [C] 
TwewN = 20; % [C]
TpN = 10; % [C]
QgN = 10 * 10^3; % [W] 
a = 0.3; 
Cp = 1000; % Cieplo wlasciwe powietrza [J/(Kg*K)]
rop = 1.2; % Gestosc powietrza [kg/m3]

% Wymiary pomieszczen
x = 6;
y = 10;
z = 2;

% Definicja objetosci pomieszczenia 
% x, y - dlugosc podstawy [m]
% z - wysokosc scian i wysokosc ostroslupa [m]
Vw = x * y * z; % Objetosc graniastoslupa prostego 
Vp = 1/3 * z * x * y; % Objetosc ostroslupa

% Parametry statyczne 
Kcw = QgN/((TwewN - TzewN) + a*(TwewN - TpN));
Kcwp = a*Kcw;
Kcp = (Kcwp * (TwewN - TpN))/(TpN - TzewN);

% Parametry dynamiczne (Cvw, Cvp)
Cvw = Cp * rop * Vw;
Cvp = Cp * rop * Vp; 

%%
% Warunki poczatkowe - Punkt Pracy
% wejscia (Qg, Tzew) 
Qg0 = QgN; 
Tzew0 = TzewN;

% Wzory na stan rownowagi 
Twew0 = (Qg0*(Kcwp + Kcp) + Tzew0*(Kcw*Kcwp + Kcw * Kcp + Kcwp * Kcp))/(Kcw*(Kcwp + Kcp) + Kcwp * Kcp);
Tp0 = ((Kcw + Kcwp)*Kcp*Tzew0 + Kcwp*(Qg0 + Kcw*Tzew0))/(Kcw*(Kcwp + Kcp) + Kcwp*Kcp);

%% Symulacja 
czas_symulacji = 12000;

t0 = 1000; % momentu wystapienia skoku 

% Warunki poczatkowe
Qg0 = QgN; 
Tzew0 = TzewN;

% Zaklocenia
dTzew = 0; 
dQg = 0.1 * QgN; 

%% Identyfikacja metoda dwupunktowa 
Delta_Twew = 3.97; 
Delta_Tp = 3;

t1Twew_wartosc_Y = 28.3/100 * Delta_Twew; 
t2Twew_wartosc_Y = 63.2/100 * Delta_Twew; 
% Odczytane z wykresu na podstawie wyzej wyliczonych wartosci
t1Twew = 1200;
t2Twew = 1600;

t1Tp_wartosc_Y = (28.3/100 * Delta_Tp) - 5; 
t2Tp_wartosc_Y = (63.2/100 * Delta_Tp) - 5; 
% Odczytane z wykresu na podstawie wyzej wyliczonych wartosci
t1Tp = 1600;
t2Tp = 2200;

TTwew = 1.5 * (t2Twew - t1Twew);
TTp = 1.5 * (t2Tp - t1Tp); 

KTwew = Delta_Twew/(dQg);
KTp = Delta_Tp/(dQg); 

T0Twew = t2Twew - TTwew; 
T0Tp = t2Tp - TTp; 

checkTwew = T0Twew/TTwew
chceckTp = T0Tp/TTp

%% Identyfikacja metoda stycznej

TTwewStyczna = 605; % Dla skoku t0 = 1000; 
T0TwewStyczna = 20; % Dla skoku t0 = 1000; 
Delta_Twew_Styczna = 3.97;
KTwew_Styczna = Delta_Twew_Styczna/dQg;

TTpStyczna = 1500; % Dla skoku t0 = 1000; 
T0TpStyczna = 200; % Dla skoku t0 = 1000; 
Delta_Tp_Styczna = 3; 
KTp_Styczna = Delta_Tp_Styczna/dQg;

% LAB7 
% Obliczanie nastaw metoda Zieglera-Nicholsa 
KpISA = (0.9*TTpStyczna)/(KTp_Styczna * T0TpStyczna);
TiISA = 3.33*T0TpStyczna;
TiIND = TiISA/KpISA; 
KpIND = KpISA; 

[t]=sim("Lab7Simulink.slx");

figure(1)
hold on
grid on
plot(t, Twew, 'r')
plot(t, Twew1, 'g')
plot(t, Twew2, 'b')
xlabel('czas t[ms]')
ylabel('Temperatura wewnetrzna [C]')
title('Porownanie metod identyfikacji - Twew')
legend('Twew - Obiekt', 'Twew - Dwupunktowa', 'Twew - Styczna')
hold off 
figure(4)
plot(t,Twew)
xlabel('czas t[ms]')
ylabel('Temperatura wewnetrzna [C]')
figure(5)
plot(t, Tp)
xlabel('czas t[ms]')
ylabel('Temperatura poddasza [C]')

figure(2)
hold on
grid on
plot(t, Tp, 'r')
plot(t, Tp1, 'g')
plot(t, Tp2, 'b')
xlabel('czas t[ms]')
ylabel('Temperatura podasza [C]')
legend('Tew')
title('Porownanie metod identyfikacji - Tp')
legend('Tp - Obiekt', 'Tp - Dwupunktowa', 'Tp - Styczna')
hold off

figure(3)
hold on
grid on
plot(t, Tp, 'r')
plot(t, Tp4, 'g')
plot(t, Tp5, 'b')
xlabel('czas t[ms]')
ylabel('Temperatura podasza [C]')
legend('Tew')
title('Odpowiedz skokowa - Tp')
legend('Tp - Bloki calkujace', 'Tp - PI transmitancja', 'Tp - PI bloki calkujace')
hold off








