clear 
close  all;


%zadanie pierwsze
poisson(1,2)
poisson(1,9)
poisson(1,5)
poisson(1,0)

poisson(2,0)
poisson(5,0)
poisson(9,0)
poisson(0,0)








in_img = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'),[1024 , 1024]);
in_img = im2gray(in_img);
figure(1);
imshow(in_img);
title("Orginalny Obraz");

[height, width, c] = size(in_img);

out_img = uint8(zeros(height,width,c));

for z = 1:c
    for h = 1:height
        for w = 1:width
            x = in_img(h, w, z); 
            k = 1;
            usave = 1;
            usave = usave * rand;
                while usave >= exp(-double(x))
                    usave = usave * rand;
                    k = k + 1;
                end     
                
            % lambda = lambda/x
            lambda = k/2;
            
            out_img(h, w, z) = lambda;
        end
    end
end

scale1 = 1024/100;
scale2 = 100/1024;

imshow(out_img);

resized1_img = imresize(out_img,scale2,"nearest");
resized2_img = imresize(resized1_img,scale1,"bilinear");
figure(2)
imshow(resized1_img);
figure(3);
imshow(resized2_img);

jakoscMSE = 0;
jakoscMAE = 0;
for n = 1:height
    for m = 1:width
        jakoscMSE = jakoscMSE +(out_img(m,n) - resized2_img(m,n))^2;
        jakoscMAE = jakoscMAE +(out_img(m,n) - resized2_img(m,n));
    end
end




function f = poisson(lambda,k)
for i=1:length(k)
    P(i) = lambda.^k(i)*exp(-lambda)/factorial(k(i));
end
f = P;
end


