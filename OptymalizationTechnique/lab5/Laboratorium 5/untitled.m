close all;
clear;

f = [1 1 1 1 1 1];
intcon = [1 2 3 4 5 6];

A = [-1 -1 0 0 0 0;
     0 -1 -1 0 0 0;
     0 0 -1 -1 0 0;
     0 0 0 -1 -1 0;
      0 0 0 0 -1 -1;
     -1 0 0 0 0 -1];
b = [-18 -7 -15 -18 -6 -4];

Aeq = [];
beq = [];
lb = [0 0 0 0 0 0];
ub = [];

[x, fval, exitflag, output] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)