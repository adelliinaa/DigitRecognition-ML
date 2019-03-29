function [C, idx,SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)

[N, dim] = size(X);
D = zeros(k,N); % KxN matrix for storing distances between
% cluster centres and observations

SSEs = zeros(maxIter);
for i = 1:maxIter
    % Compute Squared Euclidean distance (the squared distance)
    % between each cluster centre and each observation
    for c = 1:k
        D(c,:) = square_dist(X, initialCentres(c,:));
    end  
    SSE = 0;
    
    [Ds, idx] = min(D); % find min distance for each iteration 
    SSE = 0;
    % Update cluster centres
    [a,d] = size(Ds);
    if d>1
        for j = 1 : N
            SSE = SSE + Ds(1, j);
        end
    end
    SSEs(i) = SSE;
    
    for c = 1 : k
    %check the number of samples assigned to this cluster
        if(sum(idx==c) == 0)
         %   warn("k-means: cluster %d is empty", c);
        else
          initialCentres(c, :) = mean( X(idx==c,:) );
        end
       
    end  
end   
    C = initialCentres;
    figure
    plot(0:maxIter - 1, SSEs);
end