clear 
format long

f = @(x) 2x(1)^2-1.05x(1)^4+x(1)^6/6+x(1)x(2)+x(2)^2;
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);

z = 2.x.^2-1.05.x.^4+x.^6/6+x.y+y.^2;
% figure(1);
% surfc(x , y , z ) ;
figure(1);
contourf(x, y, z, 90)


MinNumberOfGeneration = 100;
MaxNumberOfGeneration = 200;

lb = [-2 -2];
ub = [2 2];
 

options = optimoptions('ga','MaxStallGeneration', MinNumberOfGeneration, ...
    'MaxGenerations', MaxNumberOfGeneration, 'PlotFcn', {@gaplotbestf, ...
    @gaplotbestindiv}, 'FunctionTolerance', 1e-8);
[x, fval, exitflag, output, population, scores] = ga(f, 2, [], [], [], ...
    [], lb, ub, [], options)


figure(1)
hold on
for i = 1:1:length(population)
    plot(population(i, 1), population(i, 2), 'g*');
end