close all;
clear;


VanilaWHT



function VanilaWHT
    %% An image 
    B = double(imread('Pasikonik-w-kwadracie.jpg'));
   A = imresize(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\Pasikonik-w-kwadracie.jpg'), [512 512]);
    %A = rgb2gray(A); % ?All I see turns to brown? - to gray, in fact (for simplicity
    
   % A = imrotate(A,1,'bilinear','crop');
       alfa = pi/2;
    rotatematrix = [cos(alfa), sin(-alfa) ; -sin(-alfa), cos(alfa)];
    B = B*rotatematrix;
    %% GUI Slider
    f = gcf; 
    c = uicontrol(f, 'Style', 'slider');
        c.Value = 0.0;
        c.Callback = @sliderMovement;
        warning('off'); 
            imshow(B); 
            
        warning('on');
    %% A GUI slider handler with the transforms
    function sliderMovement(src, ~)
        transform = 'WHT'; 
        
        switch(transform)
        %% Walsh-Hadamard transform
        case 'WHT'
            % (Forward) Transform
            B = fwht(fwht(double(A))'); 
            
            % Thresholding
            B(abs(B) < src.Value) = 0; BB = B ~= 0;
            
            % Visualisation
            warning('off');
               subplot(1, 2, 1); imshow(abs(B)); title('Walsh-Hadamard Transform');
            warning('on');
            
            % Inverse transform
            B = ifwht(ifwht(B)'); 
        end
        %% Show the result!
        BB = sum(BB(:));
        warning('off');
            subplot(1, 2, 2); 
            imshow(B, []);
            title(['Non-zeros = ' string(round(100*BB/numel(A), 2)) '%']); % prod(size(A))
        warning('on');
    end
end