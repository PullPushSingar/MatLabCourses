%{
%% ćw 1 p.1
f=[-9,-8];
A = [8,5;2,5];
b = [40,25];
Aeq=[];
beq=[];
lb=[0 0];
ub=[];
[x,fval,exitflag,output]=linprog(f,A,b,Aeq,beq,lb,ub)
y=-fval
disp(y)

%% ćw 1 p. 2
c=[0.3,0.6,0.2];
intcon=[1,2,3];
a=[-7,-3,0;0,-1,-2];
B=[-2100,-1200];
aeq=[];
Beq=[];
Lb=[0 0 0];
Ub=[];

[X,FVAL,EXITFLAG,OUTPUT]=intlinprog(c,intcon,a,B,aeq,Beq,Lb,Ub)
%}
%{
%%ćw 2 p. 1
a=6;
b=4;
f=[a,-2];
A=[-1,1;2*a,-1];
B=[b,4];
Aeq=[];
beq=[];
lb=[0 0];
ub=[];

[X,FVAL,EXITFLAG,OUTPUT]=linprog(f,A,B,Aeq,beq,lb,ub)
Y=-FVAL
%}
%{
%%ćw 2 p. 2
a=6;
b=4;
f=[-a,-1];
A=[-1,1;1/a,-1];
B=[b,4];
Aeq=[];
beq=[];
lb=[0 0];
ub=[];

[X,FVAL,EXITFLAG,OUTPUT]=linprog(f,A,B,Aeq,beq,lb,ub)
Y=-FVAL
%}
%
%%ćw 2 p. 3 
nowea=4;
noweb=6;
f=[1,nowea];
A=[1,1;-1,1];
B=[nowea,-noweb];
Aeq=[];
Beq=[];
lb=[0 0];
ub=[];
[X,FVAL,EXITFLAG,OUTPUT]=linprog(f,A,B,Aeq,Beq,lb,ub)
Y=-FVAL
%}
%{
%% Przykład praktyczny
f=[1,1,1,1,1,1];
intcon=[1,2,3,4,5,6];
A=[-1,-1,0,0,0,0;
    0,-1,-1,0,0,0;
    0,0,-1,-1,0,0;
    0,0,0,-1,-1,0;
    0,0,0,0,-1,-1;
    -1,0,0,0,0,-1];
B=[-18,-9,-15,-18,-6,-7];
Aeq=[];
beq=[];
lb=[0 0 0 0 0 0];
ub=[];

[X,FVAL,EXITFLAG,OUTPUT]=intlinprog(f,intcon,A,B,Aeq,beq,lb,ub)
%}