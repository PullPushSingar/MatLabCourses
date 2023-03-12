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
skokA = 0.1;
skokB = 0.1;
skokC = 0.1;
skokD = 0.1;

while (prawidlowy_skok(skokA) && prawidlowy_skok(skokB) && prawidlowy_skok(skokC)&& prawidlowy_skok(skokD))
rectangle('Position', [0 0 5 5]);
axis equal;
axis([0 5 0 5]);

znormalizwany_wektor_AB = (wektorXY(A,B)/odl_XY(A,B))*skokA;
A = A + znormalizwany_wektor_AB;
znormalizwany_wektor_BC = (wektorXY(B,C)/odl_XY(A,B))*skokB;
B = B + znormalizwany_wektor_BC;
znormalizwany_wektor_CD = (wektorXY(C,D)/odl_XY(C,D))*skokC;
C = C + znormalizwany_wektor_CD;
znormalizwany_wektor_DA = (wektorXY(D,A)/odl_XY(D,A))*skokD;
D = D + znormalizwany_wektor_DA;
hold on;
plot(A(1),A(2),"x","Color",[1 0 0]);
hold on;
plot(B(1),B(2),"x","Color",[0 1 0]);
hold on;
plot(C(1),C(2),"x","Color",[0 0 1]);
hold on;
plot(D(1),D(2),"x","Color",[1 0 1]);
pause(0.01);

%if (znormalizwany_wektor_AB >= 0.8*skokA)
%skokA = skokA/10;
%elseif (znormalizwany_wektor_BC >= 0.8*skokB)
%skokB = skokB/10;
%elseif (znormalizwany_wektor_CD >= 0.8*skokC)
%skokC = skokC/10;
%elseif (znormalizwany_wektor_DA >= 0.8*skokD)
%skokD = skokD/10;
%end

skokA = obliczenieSkoku(znormalizwany_wektor_AB);
skokB = obliczenieSkoku(znormalizwany_wektor_BC);
skokC = obliczenieSkoku(znormalizwany_wektor_CD);
skokD = obliczenieSkoku(znormalizwany_wektor_DA);

function f = wektorXY(X,Y)
f = [Y(1)-X(1),Y(2)-X(2)];
end

%funkcje
function f = odl_XY(X,Y)
f = sqrt((Y(1) - X(1)).^2 + (Y(2) - X(2)).^2);
end

function f = obliczenieSkoku(znormalizowanywektor,skok)
    if (znormalizowanywektor >= 0.8 * skok)
        f = skok/10;
    else
        f = skok;
    end 
end

function f = prawidlowy_skok(skok)
    if (skok > 0.000000001)
        f = 1;
    else 
        f = 0;
    end

end








