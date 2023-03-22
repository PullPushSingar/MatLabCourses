 
N =   10^7; %ilosc probek 
A = 1/sqrt(2*pi);
myX = rand(N,1) * 3 ;
myY = rand(N,1) * A;
f0 = -1*myX.^2/2;

fX = A*exp(f0);




%sort(randomVector1);
%sort(randomVector2);



IN = myY <= fX;
OUT = fX > myY;

plot(myX(IN),myY(IN),'X','Color',[1 1 0]);
hold on
plot(myX(OUT),myY(OUT),'X','Color',[0 0 0]);
wynik = 3*A*sum(IN)/N;
disp("Wynik to : " + wynik );
%plot()






