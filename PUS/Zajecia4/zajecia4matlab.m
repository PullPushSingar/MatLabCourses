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
dgq = 0;
dTzew = 2;
qg0 =   qgN;
Tzew0 = TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);
%część 3
% podpunkt 1
t_simulation = 5000;
t0 = 500;
%podpunkt 2
%qg0 = qg0 + (randn(1,1) * 100 - 50);
%Tzew0 = Tzew0 + (randn(1,1) * 2 - 1);
%zajecia
%dgq = 0.1 * qgN;




qg0 =  qgN;
Tzew0 = TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);


sim("zajecia4simulink");

figure();
hold on;
subplot(221)
plot(t,Tp - Tp0,"r");
grid on

hold on;
subplot(222)
plot(t,Twew - Twew0,"r");
grid on


qg0 =   qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("zajecia4simulink");

hold on;
subplot(221)
plot(t,Tp - Tp0,"g");
grid on

hold on;
subplot(222)
plot(t,Twew - Twew0,"g");
grid on

qg0 =  0.6 * qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("zajecia4simulink");

hold on;
subplot(221)
plot(t,Tp - Tp0,"b");
grid on
title("Odpowiedz skokowa Tp = f(t) skok dTzew = 2");
%title("Odpowiedz skokowa Tp = f(t)")
ylabel("Tp[℃]");
xlabel("czas[s]");
hold on;
%legend("qg0 = qgN, Tzew0 = TzewN", "qg0 = qgN, Tzew0 = TzewN + 5", "qg0 = 0.6*gqN, Tzew0 = TzewN + 5")
legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")
subplot(222)
plot(t,Twew - Twew0,"b");
grid on
title("Odpowiedz skokowa Twew = f(t) skok dTzew = 2");
%title("Odpowiedz skokowa Twew = f(t)")
ylabel("Twew[℃]");
xlabel("czas[s]");
%legend("qg0 = qgN, Tzew0 = TzewN", "qg0 = qgN, Tzew0 = TzewN + 5", "qg0 = 0.6*gqN, Tzew0 = TzewN + 5")
legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ",...
    "qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")


dgq = 0.1*qgN;
dTzew = 0;

qg0 =   qgN;
Tzew0 =  TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);


sim("zajecia4simulink");

hold on;
subplot(223)
plot(t,Tp - Tp0,"r");
grid on

hold on;
subplot(224)
plot(t,Twew - Twew0,"r");
grid on



qg0 =   qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("zajecia4simulink");

hold on;
subplot(223)
plot(t,Tp - Tp0,"g");
grid on

hold on;
subplot(224)
plot(t,Twew - Twew0,"g");
grid on


qg0 =  0.6*qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("zajecia4simulink");

hold on;


subplot(223)
plot(t,Tp - Tp0,"b");
grid on
title("Odpowiedz skokowa Tp = f(t), odpowiedz na skok dqg = 0.1 * qg");
%title("Odpowiedz skokowa Tp = f(t)");
ylabel("Tp[℃]");
xlabel("czas[s]");


legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0")
hold on;
subplot(224)
plot(t,Twew - Twew0,"b");
grid on
title("Odpowiedz skokowa Twew = f(t), odpowiedz na skok dqg = 0.1 * qg");
%title("Odpowiedz skokowa Twew = f(t)");
ylabel("Twew[℃]");
xlabel("czas[s]");
legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = 0.6*gqN, Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0")
















