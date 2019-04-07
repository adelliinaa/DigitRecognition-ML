function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)

numXtrain = size(Xtrain,1);
numXtest = size(Xtest,1);
numL = size(Ks,2);
distMatr = myDistance(Xtest,Xtrain);
Ypreds = zeros(numXtest,numL);
for l=1:numL
    for i=1:numXtest
        [d I] = sort(distMatr(i,:), 'ascend');
        Ypreds(i,l) = mode(Ytrain(I(1:Ks(l))));
    end
end
end