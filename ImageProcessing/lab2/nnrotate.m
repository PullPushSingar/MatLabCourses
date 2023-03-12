close all;
clear;

A = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [512 512]);

B = imrotate(A,45,"bicubic");
%C = imrotate(B,45,"nearest",Antialiasing=false);
figure(1);
imshow(B);

%imshow(C);