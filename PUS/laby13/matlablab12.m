clear;
close all;
t0 = 10;
s = tf('s');
t_simulation = 20000;
tskok = t_simulation/20;
tskok2 = tskok *  6;

a = 0.25;

% czesc 1


%popdpunkt 1
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;
Tzad = TpN;
Tp0 = Tzad;

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
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);
%Kcwp = a*Kcw;

Cvw = cp * rop * Vw;
Cvp = cp * rop * Vp;


qg0 = qgN; 
Tzew0 = TzewN;
zmianaTzew = 0;
procent_zmiany_qg = 1;

%dqg = 0.1*qgN;
Twew0 = (qg0*(Kcwp + Kcp) + Tzew0*(Kcw*Kcwp + Kcw * Kcp + Kcwp * Kcp))/(Kcw*(Kcwp + Kcp) + Kcwp * Kcp);
Tp0 = ((Kcw + Kcwp)*Kcp*Tzew0 + Kcwp*(qg0 + Kcw*Tzew0))/(Kcw*(Kcwp + Kcp) + Kcwp*Kcp);
qg0 =Twew0*(Kcw+Kcwp)-Tp0*Kcwp-Kcw*((Tp0*(Kcp+Kcwp)-Twew0*Kcwp)/Kcp);

%qg0 = qgN; 
%Tzew0 = TzewN;

dgq = 0;
%dgq = 0;
dTzew = 3;
dTzad = 3;

Kp = 0.058968;
Ki = 0.0019157;




 sim("simulinklab12.slx");


 figure(1)
 subplot(211)
 hold on;
 plot(t,y,"r");
 grid on;
 xlabel("Czas[s]")
 ylabel("Tp[stopnie]");

 subplot(212)
 hold on;
 plot(t,e,"r");
 grid on;
 xlabel("Czas[s]")
 ylabel("Wartość sterująca");


  subplot(211)
 hold on;
 plot(t,y1,"g");
 grid on;
 xlabel("Czas[s]")
 ylabel("Tp[stopnie]");

 subplot(212)
 hold on;
 plot(t,e1,"g");
 grid on;
 xlabel("Czas[s]")
 ylabel("Wartość sterująca");


 subplot(211)
 hold on;
 plot(t,y2,"b");
 grid on;
 xlabel("Czas[s]")
 ylabel("Tp[stopnie]");

 legend("CV bez ograniczeń","CV z nasyceniem (Wartność nominalna CV)","CV z ograniczeniem całkowania")

 subplot(212)
 hold on;
 plot(t,e2,"b");
 grid on;
 xlabel("Czas[s]")
 ylabel("Wartość sterująca");

 legend("CV bez ograniczeń","CV z nasyceniem (Wartność nominalna CV)","CV z ograniczeniem całkowania")







