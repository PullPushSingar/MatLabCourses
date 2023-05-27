close all;
clear;


a = 0.25;

% czesc 1


%popdpunkt 1
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;
Tzad = TpN;

%popdpunkt 2
a_p = 4;
b_p = 4;
c_p = 4;
Vw = a_p * b_p * c_p;

Vp = 0.6*Vw;

%popdunkt 3
cp = 1000; 
rop = 1.2;



%popdunkt 4 (z zajęć 2)
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN/(TwewN * (1 + a) - TzewN - a * TpN))  * (a * (TwewN - TpN))/(TpN -  TzewN);
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);

Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;

%Cvw = 1/TwewN*(qg0 - Kcw*(TwewN)- TzewN) - Kcwp(TwewN - TpN);
%Cvp = 1/TpN*(Kcwp*(TwewN - TpN) - Kcp*(TpN) - TzewN);

%częśc 2
%qg0 = qgN;
qg0 =   qgN;
Tzew0 = TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

M = [(Cvw*Cvp) (Kcwp*Cvp + Kcp*Cvw + Kcw*Cvp + Kcwp*Cvp) (Kcw*Kcwp + Kcw*Kcp + Kcp*Kcwp)];

L11 = [ Cvp (Kcwp + Kcp)];
L21 = Kcwp;
L12 = [ (Cvp*Kcw) (Kcw*Kcwp + Kcp*Kcw + Kcwp*Kcp)];
L22 = [ (Cvw*Kcp)  (Kcw*Kcp + Kcp*Kcwp + Kcwp*Kcw)];

%część 3
% podpunkt 1
t_simulation = 7500;
t0 = 500;

%podpunkt 2
%qg0 = qg0 + (randn(1,1) * 100 - 50);
%Tzew0 = Tzew0 + (randn(1,1) * 2 - 1);


%zajecia
dgq = 0.1 * qgN;
%dgq = 0;
dTzew = 0;

Lm11 = L11;
Lm21 = L21;

Mm = M;

T0TpDP = 690;
TTpDP = 850;
K0TpDP = 0.003;



T0TwewDP = 520;
TTwewDP = 327;
K0TwewDP = 0.004;




LTwew11DP = K0TwewDP;
MTwew11DP = [TTwewDP 1];

LTp11DP = K0TpDP;
MTp11DP = [TTpDP 1];


T0Tp = 540;
TTp = 1374;
K0Tp = 0.003;



T0Twew = 502;
TTwew = 381;
K0Twew = 0.004;


LTwew11 = K0Twew;
MTwew11 = [TTwew 1];

LTp11 = K0Tp;
MTp11 = [TTp 1];

sim("lab6simulink.slx");


%txTwew = 900;
%Ttwew = txTwew - t0;
%txTp = 1800;
%Ttp = txTp - t0; 

%Tpp =Tp1(1);
%Tpk = Tp1(size(Tp1));

%dxTp = Tpk - Tpp;
%kTp = dxTp/dgq;

%Twewp =Twew1(1);
%Twewk = Twew1(size(Twew1));
%dxTwew = Twewk - Twewp;
%kwew = dxTwew/dgq;



figure();
hold on;
subplot(211)
plot(t,Tp,"r");
grid on
title("Tp = f(t)");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;
subplot(212)
plot(t,Twew,"r");
grid on
title("Twew = f(t)");
ylabel("Twew[K]");
xlabel("czas[t]");


hold on;
subplot(211)
plot(t,TpS,"g");
grid on
title("Tp = f(t)");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;

subplot(212)
plot(t,TwewS,"g");
grid on
title("Twew = f(t)");
ylabel("Twew[K]");
xlabel("czas[t]");


hold on;
subplot(211)
plot(t,TpDP,"b");
grid on
title("Tp = f(t)");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;
legend("Orignalny obiekt", "Metoda Stycznej", "Metooda Dwupunktowa")
subplot(212)
plot(t,TwewDP,"b");
grid on
title("Twew = f(t)");
ylabel("Twew[K]");
xlabel("czas[t]");
legend("Orignalny obiekt", "Metoda Stycznej", "Metooda Dwupunktowa")
















