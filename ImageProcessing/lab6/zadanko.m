
%% walsh hadamard discrete cosine wavelet image thresholding
function VanilaWHT

    %% Obraz
    A = imresize(imread('lenna.jpg'), [512 512]);
    A = rgb2gray(A); % All I see turns to brown? - to gray, in fact (for simplicity)

    %% GUI suwaczek
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
            T = src.Value;
            B(abs(B) < T) = 0; BB = B ~= 0;
            
            % Kwantyzacja
            Q = 1000;
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
          %  title(['Non-zeros = ' string(round(100*BB/numel(A), 2)) '%'])
                    
            subplot(1, 3, 3); 
            imshow(A, []);
            title('Original picture. ');
        warning('on');
    end
end
