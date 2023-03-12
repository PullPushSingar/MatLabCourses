%% Preliminaries...
close all;

blades = 5;
rpm = pi/6; alpha = 0.0:pi*0.01:pi*2;

%blades = 4; rpm = pi/999; alpha = 0.0:0.01:exp(2);

%% Initial drawing...
rho = sin(blades*alpha + rpm);
%polarplot(alpha, rho, 'r');

h = getframe(gcf);
frame = h.cdata;

for m = 2:1:size(h.cdata, 2)
    %rho = abs(sin(blades * alpha + rpm*m)) - sin(blades * alpha + rpm*m);
   rho = sin(blades*alpha + rpm * m);
    polarplot(alpha, rho,'b');
    h = getframe(gcf);
   %frame(:, m, :) = h.cdata(:, m, :);
   frame(:, m, :) = h.cdata(:, m, :);
    
   
 

end
%% Demonstration!
imshow(frame);
