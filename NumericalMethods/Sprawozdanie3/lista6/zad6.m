clear ;
close all;
format long;
krokalfa = 1e-6;
iloscpokolen = 1000;
n = 1:iloscpokolen;
liczebnosc = ones(iloscpokolen,1);
alfa = 1:krokalfa:4;
bifurkacja = ones(length(alfa),1);
for j = 1:length(alfa)
    Xn = rand(1,1);
    for  i  = 1:iloscpokolen
        Xn = alfa(j)*Xn*(1-Xn);
        liczebnosc(i) = Xn;
    end
        bifurkacja(j)=liczebnosc(iloscpokolen);
end



plot(alfa,bifurkacja,".","MarkerSize",1,"Color",[1 0 0]);
title("Diagram bifurkacji")
xlabel("Alfa")
ylabel("Graniczne Xn w 1000 pokoleniu")