close all
clear;

% Wczytanie obrazu do zmiennej I
I = imread('xd2.jpg');

% Konwersja obrazu na skalę szarości, jeśli jest w kolorze
I = rgb2gray(I);

% Zmiana obrazu na wektor 1D
I = I(:)';
[row,col] = size(I);

% Inicjalizacja zmiennych do przechowywania danych kompresji
compressed = [];
count = 1;

% Pętla po każdym pikselu wektora
for i = 2:length(I)
   % Jeśli piksel jest taki sam jak poprzedni, zwiększ licznik
   if I(i) == I(i-1)
       count = count + 1;
   % W przeciwnym razie, zapisz licznik i piksel do danych kompresji
   else
       compressed = [compressed count I(i-1)];
       count = 1;
   end
end

% Zapisz ostatni licznik i piksel do danych kompresji
compressed = [compressed count I(end)];

% Inicjalizacja zmiennej do przechowywania odkompresowanego obrazu
decompressed = [];

% Pętla po danych kompresji
for i = 1:2:length(compressed)
    % Pobranie liczby powtórzeń i wartości piksela
    count = compressed(i);
    value = compressed(i+1);
    
    % Dodanie odpowiedniej liczby powtórzeń piksela do odkompresowanego obrazu
    decompressed = [decompressed repmat(value,1,count)];
end

% Konwersja odkompresowanego wektora na obraz 2D
decompressed = reshape(decompressed,row,col);

% Wyświetlenie odkompresowanego obrazu
imshow(decompressed);