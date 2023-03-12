 
function VanilaWHT
%% Obraz

    %% Obraz 
    A_ORGINAL = imread('lenna.jpg');
    A_ORGINAL = double(rgb2gray(A_ORGINAL)); 
    lambda = 1;
    A = poissrnd(double(A_ORGINAL)/lambda) * lambda;
    figure(1);
    imshow(A,[]);
    title("Obraz zaszumiony szumem Poissona")
    %% GUI suwaczek
      figure(2);
    f = gcf; 
    c = uicontrol(f, 'Style', 'slider');
        c.Value = 0.0;
        c.Callback = @sliderMovement;
        warning('off'); 
            imshow(A, []); 
        warning('on');
    %% GUI suwaczek z obługą transformaty
    function sliderMovement(src, ~)
        transform = 'WHT'; 
        
        switch(transform)
        %% Walsh-Hadamard transform
        case 'WHT'
            % Transformacja
            B = fwht(fwht(double(A))'); 
            
            % Progowanie
            T = src.Value ;
            B(abs(B) < T) = 0; BB = B ~= 0;
            
            % Kwantyzacja
            Q = 100;
            B = (floor(B*(2^Q)+0.5))/(2^Q);
            
            % Wizualizacja
            warning('off');
               subplot(1, 3, 1); imshow(abs(B)); title('Walsh-Hadamard Transform');
            warning('on');
            
            % Odwrotna transformacja
            B = ifwht(ifwht(B)'); 
            
        end
        %% Rezultaty
        BB = sum(BB(:));
        warning('off');     
            subplot(1, 3, 2); 
            imshow(B, []);
           title(['Non-zeros = ' string(round(100*BB/numel(A), 2)) '%'])
                    
            subplot(1, 3, 3); 
            imshow(A_ORGINAL, []);
            title('Original picture. ');
        warning('on');
    
        MSE = psnr(B,A_ORGINAL);
        MAE = immse(B,A_ORGINAL);

        non_zeros = string(round(100*BB/numel(A), 2));
        disp("Współczynik T " + T);
        disp("Współczynik Q " + Q);
        disp("Współczyniki nie zerowe "+non_zeros);
        disp("MSE " + MSE);
        disp("MAE " + MAE);
    end
end