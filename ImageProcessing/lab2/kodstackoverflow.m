close all;
clear



im1 = imread('lenna.jpg');
imshow(im1);  
[m,n,p]=size(im1);
thet = rand(1);
mm = m*sqrt(2);
nn = n*sqrt(2);
for t=1:mm
   for s=1:nn
      i = uint16((t-mm/2)*cos(thet)+(s-nn/2)*sin(thet)+m/2);
      j = uint16(-(t-mm/2)*sin(thet)+(s-nn/2)*cos(thet)+n/2);
      if i>0 && j>0 && i<=m && j<=n           
         im2(t,s,:)=im1(i,j,:);
      end
   end
end
figure;
imshow(im2);