function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
%Input: Xtrain = M-by-D training data matrix 
%       Ytrain = M-by-1 label vector for Xtrain
%       Xtest  = N-by-D test data matrix 
%       Ks     = 1-by-L vector of the numbers of nearest neighbours in Xtrain
%Output:Ypreds = N-by-L matrix of predicted labels for Xtest

N = size(Xtest, 1);
L = size(Ks, 1);
Ypreds = zeros(N, L);

% distance between each test point and each training observation
eucl_dist = square_dist(Xtest, Xtrain);

[d, idx] = sort(eucl_dist, 2, 'ascend');
s
for i=1:L
    k = Ks(i, 1);
    idx_neighbours = idx(:, i:k) %get indices of the k nearest neighbours 
    prediction = mode(Ytrain(idx_neighbours), 1);
    Ypreds(:, i) = prediction;
end

end