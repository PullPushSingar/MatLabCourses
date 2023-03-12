close all;
clear

 im = im2gray(imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [1024 1024]));
 %im = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [1024 1024]);
 figure(1);
 imshow(im);
 title("Orginalny Obraz");

 [img_X,img_Y] = size(im);

 scale = 4;
X = img_X/scale;
Y = img_Y/scale;



x_ratio = double(img_Y -1)/(Y - 1);
y_ratio = double(img_X -1)/(X - 1);

resized = ones(X,Y);

for i = 1:X
    for j = 1:Y 
        x_l = floor(x_ratio * j);
        y_l = floor(y_ratio * i);
        x_h = ceil(y_ratio * i);
        y_h = ceil(y_ratio * i);

        x_weight = (x_ratio * j)  -x_l;
        y_weight = (y_ratio * i) - y_l;

      a = [y_l, x_l];
      b = [y_l, x_h];
      c = [y_h, x_l];
      d = [y_h, x_h];

      pixel = a * (1 - x_weight) * (1 - y_weight)+ b * x_weight * (1 - y_weight) + c * y_weight * (1 - x_weight) +   d * x_weight * y_weight;



      resized(i,j) = pixel;
    end

end
imshow(resized);
