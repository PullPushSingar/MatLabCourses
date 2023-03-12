close all;
clear

 obraz = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [64 64]);
 figure(1);
 imshow(obraz);
 title("Orginalny Obraz");
 skaladopomniejszenia = 1;
 skaladopowiekszenia = 15;
 

 pomniejszonyobraz = pomniejszanieObrazu(obraz,skaladopomniejszenia);

 figure(2);
 imshow(pomniejszonyobraz);
 title("Pomniejszony Obraz");

 powiekszonyobraz = powiekszenieObrazu(pomniejszonyobraz,skaladopowiekszenia);

 figure(3);
 imshow(powiekszonyobraz);
 title("Powiekszony Obraz");








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