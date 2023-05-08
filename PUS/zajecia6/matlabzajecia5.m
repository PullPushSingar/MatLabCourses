close all;
clear;


a = 0.25;

% czesc 1


%popdpunkt 1
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;

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
%qg0 =   qgN;
%Tzew0 = TzewN;
%POPDUNKT 2
%zmianaTzew = 10;
%Tzew0 = TzewN + zmianaTzew;
%PODPUNKT 3
zmianaTzew = 10;
procent_zmiany_qg = 0.75;
qg0 = qgN*procent_zmiany_qg;
Tzew0 = TzewN + zmianaTzew;


Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);


M = [(Cvw*Cvp) (Kcwp*Cvp + Kcp*Cvw + Kcw*Cvp + Kcwp*Cvp) (Kcw*Kcwp + Kcw*Kcp + Kcp*Kcwp)];

L11 = [ Cvp (Kcwp + Kcp)];
L21 = Kcwp;
L12 = [ (Cvp*Kcw) (Kcw*Kcwp + Kcp*Kcw + Kcwp*Kcp)];
L22 = [ (Cvw*Kcp)  (Kcw*Kcp + Kcp*Kcwp + Kcwp*Kcw)];

t_simulation = 5000;
t0 = 500;


T0Tp = 565.672;
TTp = 1323.868;
K0Tp = 0.003;

dgq = 0.1 * qgN;
%dgq = 0;
dTzew = 1;

Lm11 = L11;
Lm21 = L21;

Mm = M;

K = 0.003;
Kp = (0.9*T0Tp)/(K*50);
tp = 3.33 * 65.672;
Ki = Kp/tp;
Ti = tp/Kp;





sim("C:\Users\huber\Documents\MATLAB\Zajecia5\simulinkzajecia4.slx");


txTwew = 900;
Ttwew = txTwew - t0;
txTp = 1800;
Ttp = txTp - t0; 


%styczna
Tpp =Tp1(1);
Tpk = Tp1(size(Tp1));

dxTp = Tpk - Tpp;
kTp = dxTp/dgq;

Twewp =Twew1(1);
Twewk = Twew1(size(Twew1));

dxTwew = Twewk - Twewp;
kwew = dxTwew/dgq;







hold on;
subplot(231)
disp(t)
disp(Tp)
plot(t,Tp,"r");
grid on
title("Tp = f(t)");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;
subplot(234)
plot(t,Twew,"g");
grid on
title("Twew = f(t)");
ylabel("Twew[K]");
xlabel("czas[t]");









subplot(232)
disp(t)
disp(Tp)
plot(t,Tp1,"r");
grid on
title("Tp = f(t) (zajecia 6) ");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;
subplot(235)
plot(t,Twew1,"g");
grid on
title("Twew = f(t) (zajecia 6) ");
ylabel("Twew[K]");
xlabel("czas[t]");



subplot(233)
disp(t)
disp(Tp)
plot(t,Tp1,"r");
grid on
title("Tp = f(t) (zajecia 6 wykres 2) ");
ylabel("Tp[K]");
xlabel("czas[t]");
hold on;
subplot(236)
plot(t,Twew1,"g");
grid on
title("Twew = f(t) (zajecia 6 wykres 2) ");
ylabel("Twew[K]");
xlabel("czas[t]");
