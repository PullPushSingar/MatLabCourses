clear;
close all;
t0 = 10;
s = tf('s');
t_simulation = 10000;

k = 5;
T = 9;
T0 = 35;
tskok = t_simulation/10;


G = k/((T*s+1)*((T+5)*s+1))*exp(-s*T0)
%45 50 55 60

Kp = 0.058968;
Ki = 0.0019157;

R = Kp + Ki/s;

G_o = G*R;

T0_tab = [45, 100 , 150 , 167];




for i = 1:length(T0_tab)
    T0 = T0_tab(i);
    sim("simulinklab12.slx");

    figure(1)
    hold on
    grid on
    plot(t,y)
    xlabel('czas t[s]')
    ylabel('Temperatura [K + 273.15]')
    title("y = f(t)")
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")

    figure(2)
    hold on
    grid on
    plot(t,e)
    xlabel('Uchyb t[s]')
    ylabel('Temperatura [K + 273.15]')
    title("e = f(t)")
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")

    figure(3)
    hold on
    grid on
    plot(t,CV)
    xlabel('CV t[s]')
    ylabel('Temperatura [K + 273.15]')
    title("CV = f(t)")
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")



end    



for i = 1:length(T0_tab)

    figure(4);
    hold on;
    grid on;
    T0 = T0_tab(i);
    G = k/((T*s+1)*((T+5)*s+1))*exp(-s*T0);
    G_o = G*R;
    margin(G_o) 
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")


    figure(5)
    grid on;
    subplot(2,2,i)
    margin(G_o) 
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")
    
    



end 





for i = 1:length(T0_tab)

    figure(6);
    hold on;
    grid on;
    T0 = T0_tab(i);
    G = k/((T*s+1)*((T+5)*s+1))*exp(-s*T0);
    G_o = G*R;
    nyquist(G_o)
    axis([-1 1 -1 1])
    rectangle('Position', [-1,-1,2,2], 'Curvature', [1 1])
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")

    figure(7)
    grid on;
    subplot(2,2,i)
    nyquist(G_o)
    axis([-1 1 -1 1])
    rectangle('Position', [-1,-1,2,2], 'Curvature', [1 1])
    legend("T0 = 45","T0 = 100","T0 = 150","T0 = 167")
    
end 


