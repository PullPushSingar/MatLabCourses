clear;
close all;
N = 10^6;

Zakres = 2:N;
tic
czyJestPierwsza = ones(N,1);
pierwiastekN = floor(sqrt(N));
for  i = 2:pierwiastekN
    wielokrotnoscLiczby = i;
    while wielokrotnoscLiczby <= N
        if wielokrotnoscLiczby == i
            wielokrotnoscLiczby = wielokrotnoscLiczby + i;
    
        elseif mod(wielokrotnoscLiczby,i) == 0
            czyJestPierwsza(wielokrotnoscLiczby) = 0;
            wielokrotnoscLiczby = wielokrotnoscLiczby + i;
        end      
    end               
end
counter = 0;
for i =  Zakres
    if czyJestPierwsza(i) == 1
        counter = counter + 1;
    end
end
wartosciSpiraliUlama = ones(counter,1);
aktualnyIndeksSpiraliUlama = 1;
for i = Zakres
    if czyJestPierwsza(i) == 1
        wartosciSpiraliUlama(aktualnyIndeksSpiraliUlama) = i;
        aktualnyIndeksSpiraliUlama = aktualnyIndeksSpiraliUlama + 1;
    end
end
toc
polarplot(wartosciSpiraliUlama,"X");
