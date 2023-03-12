close all;
clear

 obraz = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [512 512]);
 figure(1);
 imshow(obraz);
 title("Orginalny Obraz");

 obroconyobraz = obracanieobrazu(obraz,45);

 figure(2);
 imshow(obroconyobraz);
 title("Orginalny Obraz");

function f = obracanieobrazu(obraz,katobrotu)
 rozmiar = size(obraz);
 kat = katobrotu - 360;
 katrad = (2 * pi * kat)/360;

 y_tlo = ceil(rozmiar(1) * abs(cos(katrad)) + rozmiar(2)* abs(sin(katrad)));
 x_tlo = ceil(rozmiar(1) * abs(sin(katrad)) + rozmiar(2)* abs(cos(katrad)));

 obroconyobraz = uint8(ones([y_tlo , x_tlo , 3]));
 orginal_srodek_x = ceil(rozmiar(1)/2);
 orginal_srodek_y = ceil(rozmiar(2)/2);

 obrocony_srodek_x = ceil((size(obroconyobraz,1))/2);
 obrocony_srodek_y = ceil((size(obroconyobraz,2))/2);

% w pętli obliczane są współrzędne pikseli A dla każdego 
% piksela B, a jego intensywaność zostanie przypisana po sprawdzeniu
for i=1:size(obroconyobraz,1)
    for j=1:size(obroconyobraz,2)                                                       

         x = -(i - obrocony_srodek_x) * (cos(katrad)) + (j - obrocony_srodek_y) * (sin(katrad));                                       
         y = (i - obrocony_srodek_x) * (sin(katrad)) + (j - obrocony_srodek_y) * (cos(katrad));
         
         x = round(x) + orginal_srodek_x;
         y = round(y) + orginal_srodek_y;

         if (x >= 1 && y >= 1 && x <= size(obraz,1) &&  y <= size(obraz,2)) 
              obroconyobraz(i,j,:) = obraz(x,y,:);  
         end
    end
end

f = obroconyobraz;
end