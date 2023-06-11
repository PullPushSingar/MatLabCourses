clear;
close all;




T0 = 690;
T = 850;
K = 0.003;

t0 = 500;
t_simulation = 20000;

q0 = 1000;
dqg = 1000;

%pid tunner Kp = 412.417
%troche wyższy Kp = 720.500
%Niestabilny Kp = 942
Kpg = [412.7312 720.2327 1000];
Kp1 = [0.2706 0.46885 1.13];
Kp2 = [4.6672 254.2357 500.2137];



a = 2;
b = 5;
c = 0;

s3 = a*b;
s2 =  a + b;
s1 = 1;
s0 = 0;




for i = 1:3
figure(1)
Kp = Kpg(i);  
Kpm1 = Kp1(i);  
sim("lab10simslx.slx")
subplot(3,1,i)

switch i
    case 1
    plot(t,e,'r')
    hold on;
    plot(t,e,"b")
    title("Pid tuner")
    case 2
    plot(t,y,'r')
    hold on;
    plot(t,e,"b")
    title("Wikesza wartosc")

    case 3
    plot(t,y,'r')
    hold on;
    plot(t,e,"b")
    title("Niestabilnosc")

end


grid on;
ylabel("Moc[P]")
xlabel("t[s]")

figure(2);

subplot(3,1,i)

switch i
    case 1
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Pid tuner")
    case 2
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Wikesza wartosc")

    case 3
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Niestabilnosc")

end
grid on;
ylabel("Moc[P]")
xlabel("t[s]")





end
s3 = 0;
s2 =  a * b;
s1 = a + b;
s0 = 1;

figure(3)
for i = 1:3

Kpm1 = Kp2(i);  
sim("lab10simslx.slx")
subplot(3,1,i)

switch i
    case 1
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Pid tuner")
    case 2
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Wikesza wartosc")

    case 3
    plot(t,y1,'r')
    hold on;
    plot(t,e1,"b")
    title("Niestabilnosc")

end


grid on;
ylabel("Moc[P]")
xlabel("t[s]")

end




%G1
%pid tunner Kp = 0.2706
%troche wyższy Kp = 0.46885
%Niestabilny Kp = 1.3148






