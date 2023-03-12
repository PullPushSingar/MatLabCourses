clear;
close all;

d = 10; %ilosc wspolrzednych
N = 10^5; %liczba próbek
p = 1; % norma
r = 1; %promien
X = linspace(-1,1,N);

V1 = 0;
Vd = ones(d,1);
for i = 1:d
    nextd = 2*rand(N,1) - 1;
    if V1 == 0
        V1 = abs(nextd.^p);
    else
        V1 = V1 + abs(nextd.^p);
    end
    V2 = V1.^(1/p);

    Vin = V2 <=1;
    Vout = V2 > 1;
    
    counterIn = 0;
    

        for j = 1:N
            if Vin(j) == 1
                counterIn = counterIn + 1;
            end
        end
        counterOut = N - counterIn;
        surface = 2^3*counterIn/(counterOut+counterIn);
        Vd(i) = surface;
        V2 = 0;
       
end
dx= 1:d;
disp(Vd)
plot(dx,Vd);



%plot(Xrand,Vout,"O")
axis equal;