function out = interpolateLinear(in, ratio)
    % Tworzymy macierz zer o odpowiednim rozmiarze
    out = zeros(floor(size(in, 1) * ratio), floor(size(in, 2) * ratio), size(in, 3));
    
    % Obliczamy współczynniki interpolacji
    x = (1:size(out, 2)) / ratio;
    y = (1:size(out, 1)) / ratio;
    
    % Interpolujemy każdy kanał obrazu
    for i = 1:size(in, 3)
        out(:,:,i) = interp2(in(:,:,i), x, y.');
    end
end

function out = interpolateCubic(in, ratio)
    % Tworzymy macierz zer o odpowiednim rozmiarze
    out = zeros(floor(size(in, 1) * ratio), floor(size(in, 2) * ratio), size(in, 3));
    
    % Obliczamy współczynniki interpolacji
    x = (1:size(out, 2)) / ratio;
    y = (1:size(out, 1)) / ratio;
    
    % Interpolujemy każdy kanał obrazu
    for i = 1:size(in, 3)
        out(:,:,i) = interp2(in(:,:,i), x, y.', 'cubic');
    end
end