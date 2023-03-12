clear;
close all;

Nlow = [10,30,50,70,90,100,300,500,700,900,1000,3000,5000,7000,9000];
Nhigh = [1*10^4,2*10^4,5*10^4,1*10^5,2*10^5,5*10^5,1*10^6,2*10^6,5*10^6,1*10^7,2*10^7,5*10^7,1*10^8];
averageresultlow = [0.47873,0.51463,0.48590,0.48386,0.47484,0.51224,0.51344,0.50291,0.48848,0.49030,0.51332,0.49620,0.49711,0.49854,0.49976];
averageresulthigh = [0.49605,0.49825,0.49838,0.49928,0.49847,0.49861,0.49825,0.49871,0.49885,0.49872,0.49865,0.49863,0.49865];
averagebadhhigh = [0.00260,0.00040,0.0027,0.00063,0.00018,0.00004,0.00040,0.00006,0.00020,0.00007,0.00000,0.00002,0.00000];
averagebadhlow = [0.019918,0.015984,0.012748,0.14791,0.023809,0.013592,0.014788,0.004256,0.010174,0.008349,0.014669,0.002447,0.001536,0.000107,0.001106];


XD = 2 ;
if XD == 1
    plot(Nlow,averageresultlow);
    title("Wynik programu w funkcji N");
    xlabel("N");
    ylabel("Średnia z  10 wyników");

elseif XD == 2
    plot(Nhigh,averageresulthigh);
    title("Wynik programu w funkcji N");
    xlabel("N");
    ylabel("Średnia z  10 wyników");

elseif XD == 3
    plot(Nlow,averagebadhlow);
    title("Wynik błedu bezwzględnego programu w funkcji N");
    xlabel("N");
    ylabel("Średnia błedu bezwzględnego z  10 wyników");
elseif XD == 4
    plot(Nhigh,averageresulthigh);
    title("Wynik błedu bezwzględnego programu w funkcji N");
    xlabel("N");
    ylabel("Średnia błedu bezwzględnego z  10 wyników");
end


