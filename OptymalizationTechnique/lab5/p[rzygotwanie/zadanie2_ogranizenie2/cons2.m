function [b, beq] = cons2( x )
    b = x(2) + x(1).^2 + x(1).*4 + 4;
    beq = [];
end