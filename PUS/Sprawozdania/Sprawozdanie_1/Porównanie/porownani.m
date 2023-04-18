close all;clear;

%określenie parametrów obiketu i środkowsiska
a = 0.25;
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;

a_p = 4;
b_p = 4;
c_p = 4;
Vw = a_p * b_p * c_p;
Vp = 0.6*Vw;
cp = 1000; 
rop = 1.2;

%Identyfikacja warunków ciepła
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN/(TwewN * (1 + a) - TzewN - a * TpN))  * (a * (TwewN - TpN))/(TpN -  TzewN);
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);

Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;


%Określenie warunków początkowych

qg0 =   qgN;
Tzew0 = TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

%Impuls skokowy Tzew
dgq = 0;
dTzew = 2;

% czas symulacji oraz czas nastąpienia skoku
t_simulation = 5000;
t0 = 500;



sim("Lab4");

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

sim("Lab4");

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

sim("Lab4");

hold on;
subplot(221)
plot(t,Tp - Tp0,"b");
grid on
title("Odpowiedz skokowa Tp = f(t) skok dTzew = 2");

ylabel("Tp[℃]");
xlabel("czas[s]");
hold on;

legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")
subplot(222)
plot(t,Twew - Twew0,"b");
grid on
title("Odpowiedz skokowa Twew = f(t) skok dTzew = 2");

ylabel("Twew[℃]");
xlabel("czas[s]");
legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ",...
    "qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")

%Impuls skokowy qg
dgq = 0.1*qgN;
dTzew = 0;

qg0 =   qgN;
Tzew0 =  TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);


sim("Lab4");

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

sim("Lab4.slx");

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

sim("Lab4");

hold on;


subplot(223)
plot(t,Tp - Tp0,"b");
grid on
title("Odpowiedz skokowa Tp = f(t), odpowiedz na skok dqg = 0.1 * qg");

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

ylabel("Twew[℃]");
xlabel("czas[s]");
legend("qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "qg0 = 0.6*gqN, Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0")

dgq = 0;
dTzew = 2;


%Obliczenie transmitancji
M = [(Cvw*Cvp) (Kcwp*Cvw + Kcp*Cvw + Kcw*Cvp + Kcwp*Cvp) (Kcw*Kcwp + Kcw*Kcp + Kcp*Kcwp)];

L11 = [ Cvp (Kcwp + Kcp)];
L21 = Kcwp;
L12 = [ (Cvp*Kcw) (Kcw*Kcwp + Kcp*Kcw + Kcwp*Kcp)];
L22 = [ (Cvw*Kcp)  (Kcw*Kcp + Kcp*Kcwp + Kcwp*Kcw)];


sim("Lab5");

hold on;
subplot(221)
plot(t,Tp - Tp0,"c");
grid on

hold on;
subplot(222)
plot(t,Twew - Twew0,"c");
grid on


qg0 =   qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("Lab5");

hold on;
subplot(221)
plot(t,Tp - Tp0,"m");
grid on

hold on;
subplot(222)
plot(t,Twew - Twew0,"m");
grid on

qg0 =  0.6 * qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("Lab5");

hold on;
subplot(221)
plot(t,Tp - Tp0,"k");
grid on
title("Odpowiedz skokowa Tp = f(t) skok dTzew = 2");
%title("Odpowiedz skokowa Tp = f(t)")
ylabel("Tp[℃]");
xlabel("czas[s]");
hold on;

legend("blok całkujący: qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "blok całkujący: qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "blok całkujący: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2", ...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "Transmitancje: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")
subplot(222)
plot(t,Twew - Twew0,"k");
grid on
title("Odpowiedz skokowa Twew = f(t) skok dTzew = 2");

ylabel("Twew[℃]");
xlabel("czas[s]");

legend("blok całkujący: qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "blok całkujący: qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "blok całkujący: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2", ...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN, dqg = 0, dTzew = 2 ",...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2 ", ...
    "Transmitancje: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0, dTzew = 2")


dgq = 0.1*qgN;
dTzew = 0;

qg0 =   qgN;
Tzew0 =  TzewN;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);


sim("Lab5");

hold on;
subplot(223)
plot(t,Tp - Tp0,"c");
grid on

hold on;
subplot(224)
plot(t,Twew - Twew0,"c");
grid on



qg0 =   qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("Lab5");

hold on;
subplot(223)
plot(t,Tp - Tp0,"m");
grid on

hold on;
subplot(224)
plot(t,Twew - Twew0,"m");
grid on


qg0 =  0.6*qgN;
Tzew0 = TzewN + 5;
Twew0 = ((qg0*(Kcp + Kcwp))/(Kcwp*Kcw + Kcp * Kcw + Kcp * Kcwp)) + Tzew0;
Tp0 = (Kcp*Tzew0 + Kcwp * Twew0)/(Kcwp + Kcp);

sim("Lab5");

hold on;


subplot(223)
plot(t,Tp - Tp0,"k");
grid on
title("Odpowiedz skokowa Tp = f(t), odpowiedz na skok dqg = 0.1 * qg");

ylabel("Tp[℃]");
xlabel("czas[s]");

%legenda 
legend("blok całkujący: qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "blok całkujący: qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "blok całkujący: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0", ...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "Transmitancje: Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0")
hold on;
subplot(224)
plot(t,Twew - Twew0,"k");
grid on
title("Odpowiedz skokowa Twew = f(t), odpowiedz na skok dqg = 0.1 * qg");

ylabel("Twew[℃]");
xlabel("czas[s]");
legend("blok całkujący: qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "blok całkujący: qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "blok całkujący: qg0 = 0.6*qgN, Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0", ...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN, dqg = 0.1*qg, dTzew = 0 ",...
    "Transmitancje: qg0 = qgN, Tzew0 = TzewN + 5d, dqg = 0.1*qg, dTzew = 0 ",...
    "Transmitancje: Tzew0 = TzewN + 5, dqg = 0.1*qg, dTzew = 0")