function R = ruinSim(x,T,Lm,c,G, MCLength)
    
    temp = size(Lm);
    if temp(1) == 1
        Lm = Lm.*ones(T,1);
    end
    
%     MCLength = 1;
    R = zeros(T,MCLength);
    R(1,:) = x;
    I = zeros(1,MCLength);
    M = zeros(1,MCLength);
    
    for j = 1:MCLength
        i = 1;
        t = 0;
        tau(j,1) = inf; %Time of Ruin
        while t<T
            i = i + 1;
            if i >T
                break
            end
            t = t + ((-1/Lm(i))*log(rand()));
            if t>T
                break
            end
            R(i,j) = R(i-1,j) + c*((-1/Lm(i))*log(rand()));
            B = random(G);
            R(i,j) = R(i,j) - B;
            if R(i,j)<0
                I(j,1) = 1;
                tau(j,1) = i;
                M(j,1) = abs(R(i,j));
                break
            end
            if R(i,j)==R(i-1,j)
                break
            end
        end
    end
end