close all;
clear

 obraz = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [512 512]);
 figure(1);
 imshow(obraz);
 title("Orginalny Obraz");


 %Skala
 skala = 4;

 %Romiar obrazu
 rozmiar = size(obraz);

 %Pomniejszanie
 rozmiarpomniejszony = [floor(rozmiar(1)/skala),floor(rozmiar(2)/skala),3];
 
 obrazpopomnijeszeniu = ones(rozmiarpomniejszony(1),rozmiarpomniejszony(2),3);

 proporcje = [rozmiar(1)/rozmiarpomniejszony(1),rozmiar(2)/rozmiarpomniejszony(2)];

 for rgb = 1 : rozmiarpomniejszony(3)
     for szerokosc = 1 : rozmiarpomniejszony(1)
         for wysokosc = 1:rozmiarpomniejszony(2)
             x = ceil(szerokosc * proporcje(1));
             y = ceil(wysokosc * proporcje(2));
             obrazpopomnijeszeniu(szerokosc,wysokosc,rgb) = obraz(x,y,rgb);

         end
     end
 end

 figure(2);
 imshow(uint8(obrazpopomnijeszeniu));
 title("Pomniejszony Obraz");

%Powrót do orginalnego rozmiaru

 skaladopowiekszenia = 1/skala;
 rozmiarpowiekszony = [floor(rozmiarpomniejszony(1)/skaladopowiekszenia),floor(rozmiarpomniejszony(2)/skaladopowiekszenia),3];
 %Romiar obrazu
 %rozmiarpowiekszony = [floor(rozmiarpomniejszony(1)/skaladopowiekszenia),floor(rozmiarpomniejszony(2)/skaladopowiekszenia),3];
 rozmiarpowiekszonegoobrazu = size(obrazpopomnijeszeniu);
 obrazponowniepowiekszony = ones(rozmiarpowiekszony(1),rozmiarpowiekszony(2));

 proporocje2 = [rozmiar(1)/rozmiarpomniejszony(1),rozmiar(2)/rozmiarpomniejszony(2)];


 %Powiększenie
 rozmiarpomniejszony = [floor(rozmiar(1)/skala),floor(rozmiar(2)/skala),3];
 
 obrazpopowiekszeniu = ones(rozmiarpomniejszony(1),rozmiarpomniejszony(2),3);

 proporcje2 = [rozmiar(1)/rozmiarpomniejszony(1),rozmiar(2)/rozmiarpomniejszony(2)];

 for rgb = 1 : rozmiarpowiekszony(3)
     for szerokosc = 1 : rozmiarpowiekszony(1)
         for wysokosc = 1:rozmiarpowiekszony(2)
             x = ceil(szerokosc / proporcje2(1));
             y = ceil(wysokosc / proporcje2(2));
             obrazpopowiekszeniu(szerokosc,wysokosc,rgb) = obrazpopomnijeszeniu(x,y,rgb);

         end
     end
 end

 figure(3);
 imshow(uint8(obrazpopowiekszeniu));
 title("Powiekszony Pomniejszony Obraz");

 