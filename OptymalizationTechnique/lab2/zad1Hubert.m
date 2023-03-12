clear;
close all;

c = [5,-2];

A = [-1,1;10,-1];

b = [1,4];

Aeq = [];
beq = [];

lb = [0 0];

ub =[];


[X,Y,exitflag,output] = linprog(c,A,b,Aeq,beq,lb,ub)