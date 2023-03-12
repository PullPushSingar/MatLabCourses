close all;
clear

 im = im2gray(imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [1024 1024]));
 %im = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg'), [1024 1024]);
 figure(1);
 imshow(im);
 title("Orginalny Obraz");

[C ,R] = size(im);

S_R = 4;
S_C = 4;



Rprim = floor(R/S_R);
Cprim = floor(C/S_C);

rprim = 1:R;
cprim = 1:C;

[cf, rf] = meshgrid(1 : Rprim, 1 : Rprim);

rf = rf * S_R;
cf = cf * S_C;




r = floor(rf);
c = floor(cf);

r(r < 1) = 1;
c(c < 1) = 1;
r(r > R - 1) = R - 1;
c(c > C - 1) = C - 1;

delta_R = rf - r;
delta_C = cf - r;

in1_ind = sub2ind([R, C], r, c);
in2_ind = sub2ind([R, C], r+1,c );
in3_ind = sub2ind([R, C], r, c + 1);
in4_ind = sub2ind([R, C], r+1, c + 1); 

out = ones(Rprim, Cprim, size(im, 3));
out = cast(out, class(im));

 for idx = 1 : size(im, 3)
        chan = double(im(:,:,idx));
        
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + ...
                       chan(in2_ind).*(delta_R).*(1 - delta_C) + ...
                       chan(in3_ind).*(1 - delta_R).*(delta_C) + ...
                       chan(in4_ind).*(delta_R).*(delta_C);
        out(:,:,idx) = cast(tmp, class(im));
 end

 imshow(out);











