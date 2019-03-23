function [initialCentres, idx] = my_kMeansClustering(X, k, initialCentres, maxIter)

[N dim] = size(X);
D = zeros(k,N); % KxN matrix for storing distances between
% cluster centres and observations
idx_prev = zeros(1,N);

for i = 1:maxIter
    % Compute Squared Euclidean distance (the squared distance)
    % between each cluster centre and each observation
    for c = 1:k
        D(c,:) = square_dist(X, initialCentres(c,:));
    end    
    
    [Ds, idx] = min(D); % check whether we are allowed to use min()
    
    % Update cluster centres
    for c = 1 : k
    %check the number of samples assigned to this cluster
        if(sum(idx==c) == 0)
            warn("k-means: cluster %d is empty", c);
        else
            initialCentres(c, :) = mean( X(idx==c,:) );
        end
        
    end
    if( sum( abs(idx - idx_prev) ) == 0 )
        break;
    end
% update previous assignment vector with current
	
    idx_prev = idx;
    
end    
    
end