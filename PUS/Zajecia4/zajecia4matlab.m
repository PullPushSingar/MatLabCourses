close all;
clear;



% czesc 1

%popdpunkt 1
TzewN = -20;
TwewN = 20;
TpN = 10;
qgN = 10000;

%popdpunkt 2
a = 4;
b = 4;
c = 4;

%popdunkt 3
cp = 1020; 
rop = 1.2;

%popdunkt 4 (z zajęć 2)
Kcw =  qgN/(TwewN * (1 + a) - TzewN - a * TpN);
Kcp = (qgN/(TwewN * (1 + a) - TzewN - a * TpN))  * (a * (TwewN - TpN))/(TpN -  TzewN);
Kcwp = a*qgN/(TwewN*(1+a) -TzewN - a*TpN);

Cvw = 1/TwewN*(qg0 - Kcw*(TwewN)- TzewN) - Kcwp(TwewN - TpN);
Cvp = 1/TpN*(Kcwp*(TwewN - TpN) - Kcp*(TpN) - TzewN);

%częśc 2
Tzew0 = TzewN;
Twew0 = TwewN;
Tp0 = TpN;
qg0 = qgN;


%część 3
% podpunkt 1
t_simulation = 100;
t0 = 25;

%podpunkt 2
qg0 = qg0 + (randn(1,1) * 100 - 50);
Tzew0 = Tzew0 + (randn(1,1) * 2 - 1);
