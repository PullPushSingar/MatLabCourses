close all;
clear;

A = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [512 512]);
%A = rgb2gray(A);
B = bilinear_resize_RGB(A,128,128);
imshow(B);


function out = bilinear_resize_RGB(img, p, q)
  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);
  R_resize = bilinear_resize(R, p, q);
  G_resize = bilinear_resize(G, p, q);
  B_resize = bilinear_resize(B, p, q);
  out = cat(3, R_resize, G_resize, B_resize);

end

function a = bilinear_coef(f, x1, y1, x2, y2)
    A = zeros(4);
    col_1 = ones(4,1);
    A(:,1) = col_1;
    col_2 =  [x1; x1; x2; x2];
    A(:,2) = col_2;
    col_3 =  [y1; y2; y1; y2];
    A(:,3) = col_3;
    col_4 = [x1 * y1; x1 * y2; x2 * y1; x2 * y2];
    A(:,4) = col_4;
    b = [f(y1,x1); f(y2,x1);
        f(y1,x2); f(y2,x2)];
    b = double(b);
    a = A \ b;

end

function [x1,y1,x2,y2] = surrounding_points(m, n, x, y)
    x1 = fix(x);
    y1 = fix(y);
    x2 = ceil(x);
    y2 = ceil(y);

    if (y1 == m)
        y2 = y2 - 1;
    end

    if (x1 == n)
        x2 = x2 - 1;
    end

end



function R = bilinear_resize(I,p,q)
    [m ,n ,nr_colors] = size(I);
    R = zeros(p, q);
    I = double(I);
    if nr_colors > 1
        R = -1;
        return
    end

    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
    scale = [s_x s_y];
    Trans = diag(scale);
    Inv_trans = inv(Trans);
    for y = 0 : p - 1
        for x = 0 : q - 1
            v = zeros(2,1);
            v = Inv_trans * [x y]';
            x_p = v(1);
            y_p = v(2);
            x_p = x_p + 1;
            y_p = y_p + 1;
            [x1, y1 ,x2, y2] = surrounding_points(m, n, x_p, y_p);
            a = zeros(4,1);
            a =  bilinear_coef(I,x1,y1,x2,y2);
            R(y + 1, x + 1) = a(1) + a(2) * x_p + a(3) * y_p + a(4) * x_p * y_p; 

        end
    end
    R = uint8(R);


end