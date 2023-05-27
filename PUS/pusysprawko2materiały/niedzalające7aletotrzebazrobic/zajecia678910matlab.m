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

t_simulation = 25000;
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



T0Twew = 502;
TTwew = 381;
K0Twew = 0.004;

K = 0.003;
Kp = (0.9*TTp)/(K*T0Tp);
Ti = 3.33 * T0Tp;;
tp = 3.33 * 50;
Ki = 1/Ti;





LTwew11 = K;
MTwew11 = [TTwewDP 1];

LTp11 = K;
MTp11 = [TTpDP 1];


%pidtuner



%identyfikacja
Kp = (0.9*TTp)/(K0Tp*T0Tp);
Ti = 3.33*T0Tp;

sim("zajecia678910.slx");
%KpTunerObjekt = 584.5609;
%KiTunerObjekt = 0.086692;
%KpTunerModel = 486.9693;
%KiTunerModel = 1.4462;

%sim("simulinkzajecia5.slx");

%figure()
%hold on;
%subplot(211);
%plot(t,Tp0biektPIDcontroller,"r");
%grid on;
%title("Tp = f(t)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(212)
%plot(t,q0ObiektPIDcontroller,'r')
%grid on;
%title("Qn = f(t)");
%ylabel("Qn[w]");
%xlabel("czas[t]");

%hold on;
%subplot(211);
%plot(t,TpModelPIDcontroller,"b");
%grid on;
%title("Tp = f(t)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(212)
%plot(t,q0ModelPIDcontroller,'b')
%grid on;
%title("Qn = f(t)");
%ylabel("Qn[w]");
%xlabel("czas[t]");







sim("zajecia678910.slx");

%hold on;
%subplot(211);
%plot(t,Tp0biektPIDcontroller,"g");
%grid on;
%title("Tp = f(t)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(212)
%%plot(t,q0ObiektPIDcontroller,'g')
%grid on;
%title("Qn = f(t)");
%ylabel("Qn[w]");
%xlabel("czas[t]");

%hold on;
%subplot(211);
%plot(t,TpModelPIDcontroller,"k");
%grid on;
%title("Tp = f(t)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(212)
%plot(t,q0ModelPIDcontroller,'k')
%grid on;
%title("Qn = f(t)");
%ylabel("Qn[w]");
%xlabel("czas[t]");

%legend("Obiekt PID TUNER","Model PID TUNER","Obiekt ZIGLER","Model ZIGLER")
%
%hold on;
%subplot(232);
%plot(t,Tp0biektPIDcontroller,"r");
%grid on;
%title("Tp = f(t) (PID CONTROLLER)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(234)
%plot(t,q0ObiektPIDcontroller,'r')
%grid on;
%title("Qn = f(t) (PID CONTROLLER)");
%ylabel("Qn[w]");
%xlabel("czas[t]");

%hold on;
%subplot(232);
%plot(t,TpModelPIDcontroller,"b");
%grid on;
%title("Tp = f(t) (PID CONTROLLER)");
%ylabel("Tp[K]");
%xlabel("czas[t]");

%hold on;
%subplot(234)
%plot(t,q0ModelPIDcontroller,'b')
%grid on;
%title("Qn = f(t) (PID CONTROLLER)");
%ylabel("Qn[w]");
%xlabel("czas[t]");


%legend("Obiekt","Model")

s = tf('s');

KpTunerObjekt = 584.5609;
KiTunerObjekt = 0.086692;
KpTunerModel = 486.9693;
KiTunerModel = 1.4462;

G = (K/(T0TpDP*s + 1))*exp(-86*s);




R = KpTunerModel + KiTunerModel/s;

Gotwarty = G*R;


figure()
nyquist(Gotwarty)
th = 0:pi/50:2*pi;
xunit = cos(th) + pi/2;
yunit = sin(th) + pi/2;
hold on 
plot(xunit,yunit);















