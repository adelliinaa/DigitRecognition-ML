function [sol] = toMatrix(X)
    sol = zeros(28,28);
    for i = 1 : 28
        for j = 1 : 28
            sol(i,j) = X((i-1)*28+j);
        end
    end 
end