close all;
clear;

A = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [512 512]);

alfa = 45;
angle = alfa * pi/180;
B = imrotate(A,45,"bicubic");
C = imresize(B,135,"bicubic");
figure(1);
imshow(B);
figure(2);
imshow(C);