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
a_p = 5;
b_p = 5;
c_p = 5;
Vw = a_p * b_p * c_p;

Vp = 0.6*Vw;

%popdunkt 3
cp = 1000; 
rop = 1.2;

%popdunkt 4 (z zajęć 2)
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN*a*(TwewN-TpN))/((TwewN * (1 + a) - TzewN - a*TpN)  * (TpN - TzewN));
%Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);
Kcwp = a*Kcw;

Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;



zmianaTzew = 0;
procent_zmiany_qg = 1;
qg0 = qgN;
Tzew0 = TzewN;
dqg = 0.1*qgN;
Twew0 = (qg0*(Kcwp + Kcp) + Tzew0*(Kcw*Kcwp + Kcw * Kcp + Kcwp * Kcp))/(Kcw*(Kcwp + Kcp) + Kcwp * Kcp);
Tp0 = ((Kcw + Kcwp)*Kcp*Tzew0 + Kcwp*(qg0 + Kcw*Tzew0))/(Kcw*(Kcwp + Kcp) + Kcwp*Kcp);
qg0 =Twew0*(Kcw+Kcwp)-Tp0*Kcwp-Kcw*((Tp0*(Kcp+Kcwp)-Twew0*Kcwp)/Kcp);


M = [(Cvw*Cvp) (Kcwp*Cvp + Kcp*Cvw + Kcw*Cvp + Kcwp*Cvp) (Kcw*Kcwp + Kcw*Kcp + Kcp*Kcwp)];

L11 = [ Cvp (Kcwp + Kcp)];
L21 = Kcwp;
L12 = [ (Cvp*Kcw) (Kcw*Kcwp + Kcp*Kcw + Kcwp*Kcp)];
L22 = [ (Cvw*Kcp)  (Kcw*Kcp + Kcp*Kcwp + Kcwp*Kcw)];

t_simulation = 40000;
t0 = 5000;

dgq = 0;
%dgq = 0;
dTzew = 0;
dTzad = 5;

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
trasport_delay = 540.4;
trasport_delayDP =  689;


T0Twew = 502;
TTwew = 381;
K0Twew = 0.004;

K = 0.003
Kp = (0.9*TTpDP)/(K*T0TpDP)
Ti = 3.33 * T0TpDP
tp = 3.33 * 189
Ki = 1/Ti

%K = 0.003
%Kp = (0.9*TTp)/(K*T0Tp)
%Ti = 3.33 * T0Tp
%tp = 3.33 * 40.4
%Ki = 1/Ti

KpTunerObjekt = 544.8728;
KiTunerObjekt = 0.42897;
KpTunerModel = 277.4294;
KiTunerModel = 0.29028;

LTwew11 = K;
MTwew11 = [TTwewDP 1];

LTp11 = K;
MTp11 = [TTpDP 1];



%identyfikacja


sim("termin7simulink.slx");

figure();

hold on;
subplot(211)
plot(t,q0Obiekt,"g");
grid on
title("Q0 = f(t) Obiekt");
ylabel("Q0[W]");
xlabel("czas[s]");

hold on;
subplot(212)
plot(t,Tp0biekt,"g");
title("Tp = f(t) Obiekt");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
hold on;
grid on;

hold on;
subplot(211)
plot(t,q0Model,"b");
grid on
title("Q0 = f(t) Model");
ylabel("Q0[W]");
xlabel("czas[s]");

hold on;
subplot(212)
plot(t,TpModel,"b");
title("Tp = f(t) Model");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
grid on;

hold on;
subplot(211)
plot(t,q0ObiektPIDTUNER,"r");
grid on
title("Q0 = f(t) Obiekt");
ylabel("Q0[W]");
xlabel("czas[s]");

hold on;
subplot(212)
plot(t,Tp0biektPIDTUNER,"r");
title("Tp = f(t) Obiekt");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
hold on;
grid on;

hold on;
subplot(211)
plot(t,q0ModelPIDTUNER,"c");
grid on
title("Q0 = f(t) Model");
ylabel("Q0[W]");
xlabel("czas[s]");


hold on;
subplot(212)
plot(t,TpModelPIDTUNER,"c");
title("Tp = f(t) Model");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
grid on;

legend("Układ na obiekcie","Układ na modelu","Układ na obiekcie PIDTUNER","Układ na modelu PIDTUNER")

hold on;
subplot(211)
plot(t,q0Obiekt,"g");
grid on
title("Q0 = f(t) Obiekt");
ylabel("Q0[W]");
xlabel("czas[s]");

legend("Układ na obiekcie","Układ na modelu","Układ na obiekcie PIDTUNER","Układ na modelu PIDTUNER")

figure(2)

hold on;

plot(t,e_obiekt,"g");
title("Tp = f(t) Obiekt");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
hold on;
grid on;

hold on;

plot(t,e_model,"b");
grid on
title("e = f(t)");
ylabel("e");
xlabel("czas[s]");



legend("Układ na obiekcie","Układ na modelu")
%legend("Układ na modelu metoda dwupunktowa")


figure(3)

KpTunerModelloop = [277.4294 , 358.197 , 443.2213, 500.5724];
KiTunerModeloop = [0.29028, 0.28993 , 0.21688 , 0.094605];

for i = 1:length(KpTunerModelloop)
KpTunerModel = KpTunerModelloop(i);
KiTunerModel = KiTunerModeloop(i);

sim("termin7simulink.slx");


subplot(211)
hold on;
plot(t,q0ModelPIDTUNER);
grid on
title("Q0 = f(t) Model");
ylabel("Q0[W]");
xlabel("czas[s]");



subplot(212)
hold on;
plot(t,TpModelPIDTUNER);
title("Tp = f(t) Model");
ylabel("Tp[⁰C]");
xlabel("czas[s]");
grid on;

end

legend("Kp = 277.4294 , Ki = 0.29028", "Kp = 358.197 , Ki  = 0.28993","Kp = 443.2213 , Ki  = 0.21688","Kp = 500.5724 , Ki  = 0.094605")

figure()
t_raise = [785 , 657, 544, 530];
zapas_fazy = [60 , 60, 60, 60];


figure(4)
for i = 1:length(KpTunerModelloop)


figure(4)

subplot(311)
hold on;
plot(t_raise(i),KpTunerModelloop(i),"o");
grid on
title("Kp = f(tr)");
ylabel("Kp");
xlabel("tr[s]");

subplot(312)
hold on;
plot(t_raise(i),KiTunerModeloop(i),"o");
grid on
title("Ki = f(tr)");
ylabel("Ki");
xlabel("tr[s]");



subplot(313)
hold on;
plot(t_raise(i),zapas_fazy(i),"o");
title("zapas fazy = f(tr)");
ylabel("zapas fazy");
xlabel("tr[s]");
grid on;

end
legend("Kp = 277.4294 , Ki = 0.29028", "Kp = 358.197 , Ki  = 0.28993","Kp = 443.2213 , Ki  = 0.21688","Kp = 500.5724 , Ki  = 0.094605")



%s = tf('s');



%G = (K/(T0TpDP*s + 1))*exp(-86*s);




%R = KpTunerModel + KiTunerModel/s;

%Gotwarty = G*R;


%figure()
%nyquist(Gotwarty)
%th = 0:pi/50:2*pi;
%xunit = cos(th) + pi/2;
%yunit = sin(th) + pi/2;
%hold on 
%plot(xunit,yunit);


%figure()
%bode(Gotwarty)
%th = 0:pi/50:2*pi;
%xunit = cos(th) + pi/2;
%yunit = sin(th) + pi/2;
%hold on 
%plot(xunit,yunit);

























