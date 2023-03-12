clear;
close all;
format long;

mingeneration = 200;
maxgenration = 500;
lb = [];
ub = [];

fun = @(x) -(x(1) * exp(-(x(1)^2 + x(2)^2) ));

x0 = [2,0];

[x , y] = meshgrid(-2.0:0.1:2.0,-2.0:0.1:2.0 );
z = -(x .* exp(-(x.^2 + y.^2)));

figure(1)
%surfc(x,y,z);

contourf(x ,y ,z ,48);

options = optimoptions('ga',"MaxStallGeneration",mingeneration,"MaxGeneration", ...
    maxgenration,'PlotFcn',{@gaplotbestf, @gaplotbestindiv},"FunctionTolerance",1e-8);
[x,yval,exitflag,output,population,scores] = ga(fun,2,[],[],[],[],lb,ub,[],options)



figure(1)
hold on
for i = 1:1:length(population)
plot(population(i, 1), population(i, 2), 'g*');
end