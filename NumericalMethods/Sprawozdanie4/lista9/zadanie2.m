clear
close all;
%sygnal wejsciowy


example_6();


function example_1()
s1 = - 4;
s2 = -8;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end

function example_2()
s1 = - 5;
s2 = 0;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end

function example_3()
s1 = 5;
s2 = -2;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end

function example_4()
s1 = - 1 + 5i;
s2 = -1 - 5i;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end


function example_5()
s1 = 5i;
s2 = -5i;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end

function example_6()
s1 = 1 + 5i;
s2 = 1 - 5i;

numerator = 1;
denominator = [1,(-s1 - s2), (s1*s2)];
sys = tf(numerator,denominator);

figure(1)
impulse(sys);
figure(2)
step(sys);
end