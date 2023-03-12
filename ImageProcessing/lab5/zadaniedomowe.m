clear 
close all;



input_image = imresize(imread('BClambda1.jpg'),[1024 , 1024]);


%rozklad poissona
%eta = 256;
%input_image = uint8(poissrnd(double(input_image)/eta) * eta);

%figure(1);
%imshow(input_image);
title("Orginalny Obrazy")

min_size_X = 256;
min_size_Y = 256;

max_scale = 1024/256;
min_scale = 256/1024;

%@(x) (abs(x) < 1/2) //rectangle
%@(x) (abs(x)) < 1 * (1 - abs(x))  //triangle
% @(x) (abs(x) < 1 * 2 *(abs(x)).^3 - 3* (abs(x)).^2 + 1) //cobic
%samples_2D = sample_function_2d(@(x, y) x.^2 + y.^2, 17, -0.1, 0.1, -0.1, 0.1);



%FXY = sample_function( @(x) (abs(x) < 1/2), 24, 0, 64);
%FXY = sample_function( @(x) abs(x) < 1 * 1 - abs(x) , 24, -2, 2);
FXY = sample_function( @(x) (abs(x) < 1 * 2 *(abs(x)).^3 - 3* (abs(x)).^2 + 1), 3, 0, 255);


FXX = FXY/sum(FXY(:));
z = imfilter(input_image,FXX,'circular');
%figure(2);
%imshow(z);
title("Wygładzony Obraz");
%figure(3);
resize_z = imresize(z,min_scale,"bicubic");
%imshow(resize_z);
title("Pomniejszony wygładzony obraz");
%figure(4);
resize_2_z = imresize(resize_z,max_scale,"bicubic");
%imshow(resize_2_z);
title("Powięszony pomniejszony wygładzony obraz");

MSE = psnr(input_image,resize_2_z);
MAE = immse(resize_2_z,input_image);

function samples = sample_function(f, K, x_min, x_max)
%SAMPLE_FUNCTION Próbkuje zadaną funkcję w K punktach i zapamiętuje próbki w postaci wektora
%   f: funkcja do próbkowania
%   K: liczba próbek
%   x_min: minimalna wartość x dla próbek
%   x_max: maksymalna wartość x dla próbek
%   samples: wektor z próbkami f(x) dla x z przedziału [x_min, x_max]

% Oblicz wektor x dla próbek
x = linspace(x_min, x_max, K);

% Oblicz próbki f(x) dla x z wektora x
samples = f(x);

end


function samples = sample_function_2d(f, K, x_min, x_max, y_min, y_max)
%SAMPLE_FUNCTION_2D Próbkuje zadaną funkcję w K punktach na dwuwymiarowej siatce i zapamiętuje próbki w postaci macierzy
%   f: funkcja do próbkowania
%   K: liczba próbek w obu wymiarach (KxK)
%   x_min: minimalna wartość x dla próbek
%   x_max: maksymalna wartość x dla próbek
%   y_min: minimalna wartość y dla próbek
%   y_max: maksymalna wartość y dla próbek
%   samples: macierz z próbkami f(x, y) dla (x, y) z przedziału [x_min, x_max] x [y_min, y_max]

% Oblicz siatki x i y dla próbek
[x, y] = meshgrid(linspace(x_min, x_max, K), linspace(y_min, y_max, K));

% Oblicz próbki f(x, y) dla (x, y) z siatek x i y
samples = f(x, y);

end


