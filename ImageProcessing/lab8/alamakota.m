A = 'xd.jpg';

clc; clear;
A = imread('lysy_orginal.gif');
B = imread('orginalny.jpg');
disp('>>>>> A');
A=fun(A);
disp('>>>>> B');
B=fun(B);
figure(1);
imshow(A);
figure(2);
imshow(B);

%--------------------------------------------------------------------
function Output=irle(Input)

L=length(Input);
s=1;
k=1;
i=1;
while i<=L
    while s<=Input(i+1)
        Output(k)=Input(i);
        s=s+1;
        k=k+1;
    end
    i=i+2;
    s=1;
end
end
%--------------------------------------------------------------------
function [A2] = fun(A)

A1=reshape(A,1,[]);   
RLE=rle(A1);  
X2=RLE(2:2:length(RLE));
x=1;
for i=1:length(X2)
    if X2(i)>=255
      x=x+1;
    end 
end
Binary_RLE=uint8(X2);
IRLE=irle(RLE);
A2=uint8(reshape(IRLE,size(A)));
end
%--------------------------------------------------------------------
function Output=rle(Input)

L=length(Input);
j=1;
k=1;
i=1;
while i<2*L
    comp=1;
    for j=j:L
        if j==L 
            break
        end  
         if Input(j)==Input(j+1)
            comp=comp+1;
        else
            break
         end
    end
        Output(k+1)=comp;
        Output(k)=Input(j);
        if j==L && Input(j-1)==Input(j) 
                        break
        end
        i=i+1;
        k=k+2;
        j=j+1;
        if j==L 
            if mod(L,2)==0 
            Output(k+1)=1;
            Output(k)=Input(j);
            else
            Output(k+1)=1;    
            Output(k)=Input(j);
            end
             break
        end
end
end
