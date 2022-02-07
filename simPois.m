function [tN,N] = simPois(Lm,T)
    t = 0;
    N(1) = 0;
    i = 2;
    tN(1) = 0;
    while t<T
        U = rand();
        t = t + (-1/Lm)*log(U);
        N(i) = N(i-1) + 1;
        tN(i) = t;
        i = i +1;
    end
end
