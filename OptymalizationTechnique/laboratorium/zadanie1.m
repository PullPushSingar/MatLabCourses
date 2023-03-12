clear ;
close all;

c = [-9, -8];

A = [8, 5;
     2, 5];
 
b = [40, 25];

% Ustaw Aeq = [] i beq = [], jeśli nie ma równości.
Aeq=[];
beq=[];

% Dolna granica
lb=[0 0];

% Górna granica - nieokreślona
ub=[];

% x = linprog (f, A, b, Aeq, beq, lb, ub) definiuje zestaw dolnych 
% i górnych granic zmiennych projektowych, x tak, że rozwiązanie jest 
% zawsze w zakresie lb ≤ x ≤ ub. 
[X,Y,exitflag,output] = linprog(c,A,b,Aeq,beq,lb,ub);

Y = Y* - 1