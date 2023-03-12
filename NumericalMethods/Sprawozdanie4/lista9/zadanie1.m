clear;
close all;

T = [1,2,5,10];
k = 1.0;



% numterator = [1,0];
% denomenator = [1,1];
% s = tf('s');
% sys = tf(numterator,denomenator);
% figure(1);
% impulse(sys);
% figure(2);
% step(sys);

%response1(T);
%response2(T);
%response3(T);
response4(T);
function response1(T)

for i = 1 : length(T)
numterator = [0,1];
denomenator = [T(i),1];

s = tf('s');
sys = tf(numterator,denomenator);
figure(1);
impulse(sys);
grid on;
legend('T = 1','T = 2','T = 5','T = 10')
hold on;
figure(2);
step(sys);
grid on;
hold on;
legend('T = 1','T = 2','T = 5','T = 10')
end
end

function response2(T)

for i = 1 : length(T)
numterator = [1,0];
denomenator = [T(i),1];

s = tf('s');
sys = tf(numterator,denomenator);
figure(1);
impulse(sys);
grid on;
legend('T = 1','T = 2','T = 5','T = 10')
hold on;
figure(2);
step(sys);
grid on;
hold on;
legend('T = 1','T = 2','T = 5','T = 10')
end
end

function response3(T)

k = [1,2,5,10];
for i = 1 : length(k)
numterator = [0,k(i)];
denomenator = [1,0];
s = tf('s');
sys = tf(numterator,denomenator);
figure(1);
impulse(sys);
grid on;
legend('K = 1','K = 2','K = 5','K = 10')
hold on;
figure(2);
step(sys);
grid on;
hold on;
legend('K = 1','K = 2','K = 5','K = 10')
end
end

function response4(T)

k = [1,2,5,10];

for i = 1 : length(T)
numterator = [0,k(3)];
denomenator = [T(i),1,0];

s = tf('s');
sys = tf(numterator,denomenator);
figure(1);
impulse(sys);
legend('T = 1 k = 5','T = 2 k = 5','T = 5 k = 5','T = 10 k = 5')
hold on;
figure(2);
step(sys);
hold on;
legend('T = 1 k = 5','T = 2 k = 5','T = 5 k = 5','T = 10 k = 5')
end
end