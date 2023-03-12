close all;
clear ;
format long;
%rysowanie kwadratu
rectangle('Position', [0 0 5 5]);
axis equal;
axis([0 5 0 5]);
%warunki startowe
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
skokwspolny = 0.01;
stalaskoku = 0.4;
skokA = skokwspolny;
skokB = skokwspolny;
skokC = skokwspolny;
skokD = skokwspolny;

cala_odlegloscA = 0;
cala_odlegloscB = 0;
cala_odlegloscC = 0;
cala_odlegloscD = 0;



for i = 1:350
%while (prawidlowy_skok(skokA) * prawidlowy_skok(skokB) * prawidlowy_skok(skokC) * prawidlowy_skok(skokD) == 1)
rectangle('Position', [0 0 5 5]);
axis equal;
axis([0 8 0 8])


znormalizwany_wektor_AB = wektorXY(A,B)/odl_XY(A,B)*skokA;
cala_odlegloscA = cala_odlegloscA + odl_XY(A + (znormalizwany_wektor_AB),A);
A = A + znormalizwany_wektor_AB ;
cala_odlegloscB = cala_odlegloscB + odl_XY(B,C);
znormalizwany_wektor_BC = wektorXY(B,C)/odl_XY(B,C)*skokB;
B = B + znormalizwany_wektor_BC ;
cala_odlegloscC = cala_odlegloscC + odl_XY(C,D);
znormalizwany_wektor_CD = wektorXY(C,D)*skokC;
C = C + znormalizwany_wektor_CD;
cala_odlegloscD = cala_odlegloscD + odl_XY(D,A);
znormalizwany_wektor_DA = wektorXY(D,A)*skokD;
D = D + znormalizwany_wektor_DA;

hold on;
plot(A(1),A(2),"x","Color",[1 0 0]);
hold on;
plot(B(1),B(2),"x","Color",[0 1 0]);
hold on;
plot(C(1),C(2),"x","Color",[0 0 1]);
hold on;
plot(D(1),D(2),"x","Color",[1 0 1]);



%skokA = obliczenieSkoku(znormalizwany_wektor_AB,skokA);
%skokB = obliczenieSkoku(znormalizwany_wektor_BC,skokB);
%skokC = obliczenieSkoku(znormalizwany_wektor_CD,skokC);
%skokD = obliczenieSkoku(znormalizwany_wektor_DA,skokD);
%skokA = obliczenieskokuzadanie(A,B,stalaskoku);
%skokB = obliczenieskokuzadanie(B,C,stalaskoku);
%skokC = obliczenieskokuzadanie(C,D,stalaskoku);
%skokD = obliczenieskokuzadanie(D,A,stalaskoku);
end

disp(cala_odlegloscA);
%funkcje
function f = wektorXY(X,Y)
f = [Y(1)-X(1),Y(2)-X(2)];
end


function f = odl_XY(X,Y)
f = sqrt((Y(1) - X(1)).^2 + (Y(2) - X(2)).^2);
end

function f = obliczenieSkoku(znormalizowanywektorXY,skok)
    if (znormalizowanywektorXY > 0.1 * skok)
        f = skok * 0.1;
    end 
    f = skok;
end

function f = obliczenieskokuzadanie(X,Y,stala)
wektorX = (Y(1) - X(1))^2;
wektorY = (Y(2) - X(2))^2;
f = stala/(wektorX + wektorY);
end

function f = prawidlowy_skok(skokX)
    if (skokX > 0.0001*skokX)
        f = 1;
    else 
        f = 0;
    end

end








