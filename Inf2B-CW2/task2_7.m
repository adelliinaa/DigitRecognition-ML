function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)

	numSamples = size(Xtrain,1);
	subset = floor(ratio*numSamples);
	[Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain(1:subset,:), Ytrain(1:subset,:), Xtest, epsilon);
	[CM, acc] = comp_confmat(Ytest,Ypreds(:,1));
    
end