close all;    clear;


x = -10 : 1 : 10;

a = -2:.5:2;

%kolor ='rgbcrgbcrgbcrgbc';

line = 'ox-.';

%disp(line(1))


kolor = 'rgbc';
endkolor = length(kolor);
figure(1);
hold on;
grid on;
title("wykres")
ylabel("wartosc")
xlabel("argument")
for i = 1:length(a)
%    figure(1);
%    plot(x,a(i)*x.*x,kolor(mod(i,4) + 1),line(mod(i,4) + 1));
     plot(x,a(i)*x.*x,strcat(kolor(mod(i,4) + 1),line(mod(i,4) + 1)));
    %plot(x,a(i)*x.*x,kolor(mod(i,4) + 1));
    legend('r','g','b','c','r','g','b','c','r')
end
%lista = ['cos','gdzie','ktos'];
%opis = liista(1,:);
%for i = 1:3
 %   opis(i,:) = lista(i,:);
%end
%legend();







