close all;
clear ;
format long;
%rysowanie kwadratu
rectangle('Position', [0 0 5 5]);
axis equal
axis([0 5 0 5]);
%warunki poczatkowe
hold on;
Ax = 0; Ay = 5;
Bx = 5; By = 5; 
Cx = 5; Cy = 0;     
Dx = 0; Dy = 0;
A = [Ax, Ay];
B = [Bx, By];
C = [Cx, Cy];
D = [Dx, Dy];
hold on;
%plot(Ax,Ay,"x","Color",[0 0 1]);
%plot(Bx,By,"x","Color",[1 0 0]);
%plot(Cx,Cy,"x","Color",[0 1 0]);
%plot(Dx,Dy,"x","Color",[1 0 1]);
%skokA = abs(rand(1,1)*0.05);
%skokB = abs(rand(1,1)*0.05);
%skokC = abs(rand(1,1)*0.05);
%skokD = abs(rand(1,1)*0.05);
stalaskoku = 0.05;
skokA = 0.1;
skokB = 0.1;
skokC = 0.1;
skokD = 0.1;
k = 0.02;
k_A = 0.2*k;
k_B = 0.5*k;
k_c = 0.5*k;
k_d = 0.5*k;

counter = 0;
epsilon_n = zeros(224,4);
przebytatrasaA = 0;
przebytatrasaB = 0;
przebytatrasaC = 0;
przebytatrasaD = 0;
%for i = i:200
while (prawidlowy_skok(skokA) * prawidlowy_skok(skokB) * prawidlowy_skok(skokC) * prawidlowy_skok(skokD) == 1)
rectangle('Position', [0 0 5 5]);
axis equal;
axis([-2 8 -2 8]);
%K_A = randn(1,1)*k;
%K_B = randn(1,1)*k;
%K_c = randn(1,1)*k;
%K_d = randn(1,1)*k;
%losowazmianaA= randn(1,1)*k_A;
%losowazmianaB= randn(1,1)*k_B;
%losowazmianaC= randn(1,1)*k_c;
%losowazmianaD= randn(1,1)*k_d;
znormalizwany_wektor_AB = wektorXY(A,B)* skokA;
%znormalizwany_wektor_AB = (wektorXY(A,B)/odl_XY(A,B))* skokA;
przebytatrasaA = przebytatrasaA + odl_XY(A + znormalizwany_wektor_AB,A);
A = A + znormalizwany_wektor_AB ;
%znormalizwany_wektor_BC = (wektorXY(B,C)/odl_XY(B,C))*skokB;
znormalizwany_wektor_BC = wektorXY(B,C)* skokB;
przebytatrasaB = przebytatrasaB + odl_XY(B + znormalizwany_wektor_BC,B);
B = B + znormalizwany_wektor_BC ;
%znormalizwany_wektor_CD = (wektorXY(C,D)/odl_XY(C,D))*skokC;
znormalizwany_wektor_CD = wektorXY(C,D)* skokC;
przebytatrasaC = przebytatrasaC + odl_XY(C + znormalizwany_wektor_CD,C);
C = C + znormalizwany_wektor_CD ;
%znormalizwany_wektor_DA = (wektorXY(D,A)/odl_XY(D,A))*skokD;
znormalizwany_wektor_DA = wektorXY(D,A)* skokD;
przebytatrasaD = przebytatrasaD + odl_XY(D + znormalizwany_wektor_DA,D);
D = D + znormalizwany_wektor_DA ;

hold on;
plot(A(1),A(2),"x","Color",[1 0 0]);
hold on;
plot(B(1),B(2),"x","Color",[0 1 0]);
hold on;
plot(C(1),C(2),"x","Color",[0 0 1]);
hold on;
plot(D(1),D(2),"x","Color",[1 0 1]);
pause(0.01);
%skokA = obliczenieskokuzadanie(A,B,stalaskoku);
%skokB = obliczenieskokuzadanie(B,C,stalaskoku);
%skokC = obliczenieskokuzadanie(C,D,stalaskoku);
%skokD = obliczenieskokuzadanie(D,A,stalaskoku);
skokA = obliczenieSkoku(znormalizwany_wektor_AB,skokA);
skokB = obliczenieSkoku(znormalizwany_wektor_BC,skokB);
skokC = obliczenieSkoku(znormalizwany_wektor_CD,skokC);
skokD = obliczenieSkoku(znormalizwany_wektor_DA,skokD);
counter = counter + 1;
epsilon_n(counter,1) = skokA;
epsilon_n(counter,2) = skokA;
epsilon_n(counter,3) = skokA;
epsilon_n(counter,4) = skokA;
end
figure(2)
subplot(2,2,1)
plot(epsilon_n(:,1),"Color",[1 0 0]);
title("Krok w funkcji liczby iteracji");
xlabel("Liczba iteracji")
ylabel("Krok")
subplot(2,2,2)
plot(epsilon_n(:,2),"Color",[0 1 0]);
title("Krok w funkcji liczby iteracji");
xlabel("Liczba iteracji")
ylabel("Krok")
subplot(2,2,3)
plot(epsilon_n(:,3),"Color",[0 0 1]);
title("Krok w funkcji liczby iteracji");
xlabel("Liczba iteracji")
ylabel("Krok")
subplot(2,2,4)
plot(epsilon_n(:,1),"Color",[1 0 1]);
title("Krok w funkcji liczby iteracji");
xlabel("Liczba iteracji")
ylabel("Krok")

%funkcje
function f = wektorXY(X,Y)
f = [Y(1)-X(1),Y(2)-X(2)];
end


function f = odl_XY(X,Y)
f = sqrt((Y(1) - X(1)).^2 + (Y(2) - X(2)).^2);
end

function f = obliczenieSkoku(znormalizowanywektorXY,skok)

    if (znormalizowanywektorXY <= 5* skok)
        skok = skok*0.999;
    end 
    f = skok;
end


function f = obliczenieskokuzadanie(X,Y,stala)
wektorX = (Y(1) - X(1))^2;
wektorY = (Y(2) - X(2))^2;
f = stala/(wektorX + wektorY);
end

function f = prawidlowy_skok(skokX)
    if (skokX > 8e-2)
        f = 1;
    else 
        f = 0;
    end

end








