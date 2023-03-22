clear
N = 10000000;

X = -1:N:1;
Y = -1:N:1;
%X = 0:N:1;
p = 1/2;

xrand =rand(N,1)*X;
yrand =rand(N,1)*Y ;

xincyrcle = zeros(N,1);
yincyrcle = zeros(N,1);
V = ((abs(X)^p + abs(Y)^p))^(1/p);

for i = 1:N
    if  abs(xrand(i))^p + abs(yrand(i))^p  < 0.1
        xincyrcle(i) = xrand(i);
        yincyrcle(i) = yrand(i);
    else
         xincyrcle(i) = 0;
        yincyrcle(i) = 0;
    end
end

%plot(xrand,yrand,"o","Color",[1 0 0]);
plot(xincyrcle,yincyrcle,"o","Color",[ 0 0 0]);
%plot(xrand,yrand,"o","Color",[1 0 0]);
%plot()
%plot(X,Y);
clear