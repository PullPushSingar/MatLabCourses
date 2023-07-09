clear;
close all;

t_simulation =30;
t_start = 10;
Value_0 = 0;
Final_value = 1.5;

max_arr = [0.1,0.2,0.4];
min_max = [-0.1,-0.2,-0.4];

max = 0.3;
min = -0.3;
change = 5;

K = 5;
T = 9;
t0 = 2;


figure(1)
for i = 1:length(max_arr)
    max = max_arr(i);
    min = min_max(i);

    sim("C:\Users\huber\Documents\MATLAB\laby14\simlab14.slx")

    figure(1)
    hold on;
    grid on;
    subplot(2,3,1)
    hold on;
    plot(t,y0)
    title("y(t) bez opoznienia")
    xlabel("czas[t]")
    ylabel("y")
    
    legend("Histereza += 0.1","Histereza += 0.2","Histereza += 0.4")
    subplot(2,3,2)
    hold on;
    plot(t,y1);
    title("y(t) z opoznieniem")
    xlabel("czas[t]")
    ylabel("y")
    legend("Histereza += 0.1","Histereza += 0.2","Histereza += 0.4")

    subplot(2,3,3)
    hold on;
    grid on;
    hold on;
    plot(t,e0)
    title("e(t) bez opoznienia")
    ylabel("e")
    xlabel("czas[t]")
    legend("Histereza += 0.1","Histereza += 0.2","Histereza += 0.4")
    hold on;
    subplot(2,3,4)
    plot(t,e1);
    title("e(t) z opoznieniem")
    ylabel("e")
    xlabel("czas[t]")
    legend("Histereza += 0.1","Histereza += 0.2","Histereza += 0.4")

  
  

    


end

  subplot(2,3,5)
    plot(t,SP);
    title("SP")
    ylabel("SP")
    xlabel("czas[t]")

% sim("C:\Users\huber\Documents\MATLAB\laby14\simlab14.slx")
% 
% figure()
% subplot(2,1,1)
% hold on;
% plot(t,y0,"r")
% hold on;
% plot(t,y1,"b");
% 
% subplot(2,1,2)
% hold on;
% plot(t,e0,"r")
% hold on;
% plot(t,e1);
% 
% 
% max = 0.6;
% min = -0.6;
% 
% sim("C:\Users\huber\Documents\MATLAB\laby14\simlab14.slx")
% 
% subplot(2,1,1)
% hold on;
% plot(t,y0,"g")
% hold on;
% plot(t,y1,"m");
% 
% subplot(2,1,2)
% hold on;
% plot(t,e0m,"g")
% hold on;
% plot(t,e1,"m");


