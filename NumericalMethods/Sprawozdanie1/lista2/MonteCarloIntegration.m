 
N =   1*10^8; %ilosc punktow
A = 1/sqrt(2*pi);
Xrandomvector = rand(N,1) * 3 ;
Yrandomvector = rand(N,1) * A;
f0 = -1*Xrandomvector.^2/2;

fX = A*exp(f0);




abovegraph = Yrandomvector > fX;
undergraph = fX >= Yrandomvector;
%plot(Xrandomvector,fX,'X','Color',[0 0 0]);
hold on
%plot(Xrandomvector(undergraph),Yrandomvector(undergraph),'X','Color',[1 0 0]);
hold on
%plot(Xrandomvector(abovegraph),Yrandomvector(abovegraph),'X','Color',[1 0 1]);
hold on
wynik = 3*A*sum(undergraph)/N;
disp("Wynik to : " + wynik );
