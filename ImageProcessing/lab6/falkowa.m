
function whdcwt

    %% Pomocne funkcje
    function AA = nrmd(A)
        AA = A/max(abs(A(:)));
    end

    function AA = trhd(A, T)
        A(abs(A) < T) = 0;
        AA = A;
    end 
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
    %% GUI slider handler with the transforms
    function sliderMovement(src, ~)
        transform = 'DWT++'; 
        
        switch(transform)
        %% GUI suwaczek z obługą transformaty
        case 'DWT++'
            B = double(A);
            wn = 'bior2.2'; dwtmode('per');
            L = 4; 
            [B, C] = wavedec2(A, L, wn);
            T = src.Value * 100;
            X = B(1:C(1,1) * C(1,2));
            B(abs(B) < T) = 0;
            B(1:C(1,1) * C(1,2)) = X;
                                 
            % Transformata (dekompozycja)
            [cA, cH, cV, cD] = dwt2(A, wn);
            [ccA, ccH, ccV, ccD] = dwt2(cA, wn);
            
            % Progowanie detali
            cD  = trhd(cD, T);  cH  = trhd(cH, T);  cV  = trhd(cV, T);
            ccD = trhd(ccD, T); ccH = trhd(ccH, T); ccV = trhd(ccV, T);
            BB = [cA; cD; cH; cV; ccA, ccD; ccH, ccV] ~= 0;
            
            % Kwantyzacja
            Q = 100;
            cH = (2^(-Q))*(floor(cH*(2^Q)+0.5));
            cV = (2^(-Q))*(floor(cV*(2^Q)+0.5));
            cD = (2^(-Q))*(floor(cD*(2^Q)+0.5));
            
            % Wizualizacja
            warning('off');
               subplot(1, 3, 1);
               nrmdCA = nrmd([ccA, ccH; ccV, ccD]);
               imshow([nrmdCA, nrmd(cH); nrmd(cV), nrmd(cD)]);
               title([wn ' Welvet Transform for L = 4']);
            warning('on');
            
            % Odwrotna transformacja
            cA = idwt2(ccA, ccH, ccV, ccD, wn);
            B = idwt2(cA, cH, cV, cD, wn);
            
        end
        %% Rezultaty
        BB = sum(BB(:));
        warning('off');
            subplot(1, 3, 2); 
            imshow(B, []);
             title(['Non-zeros = ' string(round(100*BB/numel(A), 2)) '%']); 
            
            subplot(1, 3, 3); 
            imshow(A, []);
            title('Original picture');
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