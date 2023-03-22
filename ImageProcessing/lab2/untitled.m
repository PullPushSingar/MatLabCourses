

close all;
clear;

A = imresize(imTogray(imread('C:\Users\huber\Desktop\0STUDIA\analizaobrazów\lab2\lenna.jpg')), [512 512]);
B = bilinear_resize(A,128,128);
imshow(B);





function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare biliniara
    % Transforma imaginea I alb-negru din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);
    
    % TODO: cast I la double
    I = double(I);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    end

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!
    
    % TODO: calculeaza factorii de scalare
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
    scale = [s_x s_y];
    
    % TODO: defineste matricea de transformare pentru redimensionare
    Trans = diag(scale);
    
    % TODO: calculeaza inversa transformarii
    Inv_trans = inv(Trans);
  
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            v = zeros(2,1);
            v = Inv_trans * [x y]';
            x_p = v(1);
            y_p = v(2);
            
            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % TODO: afla punctele ce inconjoara punctul (xp, yp)
            [x1 y1 x2 y2] = surrounding_points(m, n, x_p, y_p);
            
            % TODO: calculeaza coeficientii de interplare a
            a = zeros(4,1);
            a =  bilinear_coef(I,x1,y1,x2,y2);
            
            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            R(y + 1, x + 1) = a(1) + a(2) * x_p + a(3) * y_p + a(4) * x_p * y_p; 
        end
    end

    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
    end