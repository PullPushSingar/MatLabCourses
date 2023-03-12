clear 
close  all;



obraz = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\zdjeciewesele.jpg'),[1367 , 2048]);
obraz = im2gray(obraz);
figure(1);
imshow(obraz);
title("Orginalny Obraz");

 

obraz = poissrnd(double(obraz)* 2.3)  / 1.8 ;
figure(2);
imshow(obraz,[min(obraz(:)),max(obraz(:))]);
imshow(obraz/512);







function f = poisson(lambda,k)

f = lambda^(k) * exp(1)^(-lambda)/silnia(k);
end

function   f=silnia(n)
wynik=1;
for i=1:n
wynik=wynik*i;
end 
f = wynik;
end


function f = pomniejszanieObrazu(obraz,skala)
    rozmiar = size(obraz);
    roz_pomniejszony = [floor(rozmiar(1)/skala),floor(rozmiar(2)/skala),3];
    obrazpomniejszony = ones(roz_pomniejszony(1),roz_pomniejszony(2),3);
    proporcje = [rozmiar(1)/roz_pomniejszony(1),rozmiar(2)/roz_pomniejszony(2)];

     for rgb = 1 : roz_pomniejszony(3)
        for szerokosc = 1 : roz_pomniejszony(1)
            for wysokosc = 1:roz_pomniejszony(2)
                x = ceil(szerokosc * proporcje(1));
                y = ceil(wysokosc * proporcje(2));
                obrazpomniejszony(szerokosc,wysokosc,rgb) = obraz(x,y,rgb);

            end
        end
     end

f = uint8(obrazpomniejszony);

end



function f = powiekszenieObrazu(obraz,skala)
    skala = 1/skala;
    rozmiar = size(obraz);
    roz_powiekszony = [floor(rozmiar(1)/skala),floor(rozmiar(2)/skala),3];
    obrazpowiekszony = ones(roz_powiekszony(1),roz_powiekszony(2),3);
    proporcje = [rozmiar(1)/roz_powiekszony(1),rozmiar(2)/roz_powiekszony(2)];

     for rgb = 1 : roz_powiekszony(3)
        for szerokosc = 1 : roz_powiekszony(1)
            for wysokosc = 1:roz_powiekszony(2)
                x = ceil(szerokosc * proporcje(1));
                y = ceil(wysokosc * proporcje(2));
                obrazpowiekszony(szerokosc,wysokosc,rgb) = obraz(x,y,rgb);

            end
        end
     end

f = uint8(obrazpowiekszony);

end