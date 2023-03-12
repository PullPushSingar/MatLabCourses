close all;
clear;


N = 21; % wymiar tablicy NXN N jest nieparzyste

board = ones(N,N);

centerPoint = floor(N/2) + 1;
R = 195;
for i = 1:N
    for j = 1:N
        if floor((centerPoint - i).^2  + (centerPoint - j).^2) > R 
            board(i,j) = 0;
         
        end

    end
end


disp(board);
