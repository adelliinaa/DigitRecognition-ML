function [EVecs, EVals] = comp_pca(X)
    %Lab 3, page 7-9
    X2 = double(X)./255.0;
    Cov = calc_Cov(X2);
    [PC,V] = eig(Cov);
    for x = 1: size(PC, 2)
        if PC(1,x)<0
            PC(:,x) = PC(:,x)*(-1);
        end
    end
    % extract diagonal of matrix as vector
    V = diag(V);
    % sort the variances in decreasing order
    [tmp, ridx] = sort(V, 1, 'descend');
    V = V(ridx);
    PC = PC(:, ridx);
    EVecs = PC;
    EVals = V;
end