clear;
close all;

c = [0.3, 0.6, 0.2];
intcon = [1 2 3];

A = [-7 -3 0;
      0 -1 -2];

b = [-2100 -1200];

% Ustaw Aeq = [] i beq = [], jeśli nie ma równości.
Aeq = [];
beq = [];

% Dolna granica
lb = [0 0 0];

% Górna granica - nieokreślona
ub = [];

% x = intlinprog (f, intcon, A, b, Aeq, beq, lb, ub) definiuje zestaw 
% dolnych i górnych granic zmiennych projektowych, x tak, że rozwiązanie 
% jest zawsze w zakresie lb ≤ x ≤ ub. 
[X, FVAL , EXITFLAG, OUTPUT] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub)