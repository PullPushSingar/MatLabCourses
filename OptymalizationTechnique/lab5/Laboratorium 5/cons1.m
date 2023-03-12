function [b, c, beq, ceq] = cons1( x )
    b = -x(1) + (x(2)- 3).^2;
    c = -x(2) + x(1).^3 + 0.5;
    beq = [];
    ceq = [];
end