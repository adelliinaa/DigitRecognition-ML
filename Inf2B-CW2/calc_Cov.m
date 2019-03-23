function [Cov] = calc_Cov(M)

    mu = sum(M)/size(M,1);
    M_mean_substract = bsxfun(@minus, M, mu);
    Cov = (M_mean_substract.'*M_mean_substract)/(size(M,1)-1);

end