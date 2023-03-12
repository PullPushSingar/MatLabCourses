clear ;
close all;

alfa = 3,8;
Xn  = 0.3;
format long;
iloscpokolen = 1000;
n = 1:iloscpokolen;

liczebnosc = ones(iloscpokolen,1);


for  i  = 1:iloscpokolen
    
    Xn = alfa*Xn*(1-Xn);
    liczebnosc(i)= Xn;
    
end
plot(n,liczebnosc,"x");