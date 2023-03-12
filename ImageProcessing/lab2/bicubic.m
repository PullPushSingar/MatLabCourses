
























function [x1, y1, x2, y2] = surrounding_points(m, n, x, y)
    x1 = fix(x);
    y1 = fix(y);
    x2 = ceil(x);
    y2 = ceil(y);
    if (y1 == m)
        y2 = y2 - 1;
    end

     if (x1 == n)
        x2 = x2 - 1;
     end
end


function R = bicubic_resize(I, p, q)

    [m , n , nr_colors] = size(I);
    R = zeros(p, q);
    I = double(I);
    if nr_colors > 1
        R = -1;
        return
    end
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
    scale = [s_x s_y];
    Trans = diag(scale);
    Inv_trans = inv(Trans);
    [Ix, Iy, Ixy] = precalc_d(I);
    for y = 0 : p - 1
        for x = 0 : q - 1
            v = zeros(2,1);
            v = Inv_trans * [x y]';
            x_p = v(1);
            y_p = v(2);
            x_p = x_p + 1;
            y_p = y_p + 1;
            [x1 ,y1 ,x2, y2] = surrounding_points(m, n, x_p, y_p);
            A = zeros(4);
            A =  bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            x_p = x_p - x1;
            y_p = y_p - y1;
            vect_y = [1 y_p y_p^2 y_p^3];
            vect_x = [1 x_p x_p^2 x_p^3];
            R(y + 1, x + 1) = vect_x * A * vect_y';
        end
    end
    R = uint8(R);
end

function out = bicubic_resize_RGB(img, p, q)
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);
    R_resize = bicubic_resize(R, p, q);
    G_resize = bicubic_resize(G, p, q);
    B_resize = bicubic_resize(B, p, q);
    out = cat(3, R_resize, G_resize, B_resize);
end