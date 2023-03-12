clear ;
close all;
format long;

alfa = 3.99;
x0 = 0.8;
iloscpokolen = 1000;
n = 1:iloscpokolen;
liczebnosc = ones(iloscpokolen,1);

Xn = x0;
for i = 2:iloscpokolen
        Xn= alfa*Xn*(1-Xn);
        liczebnosc(i) = Xn;
end

plot(n,liczebnosc,"*","Color",[0 1 1] );
grid on;
title("Liczebność pokolenia w funkcji populacji");
xlabel("Iteracja (liczba genreacji)");
ylabel("Liczebność w danej generacji")