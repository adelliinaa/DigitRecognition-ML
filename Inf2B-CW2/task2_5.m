function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
	% Input:
	% Xtrain : M-by-D training data matrix (double)
	% Ytrain : M-by-1 label vector (unit8) for Xtrain
	% Xtest : N-by-D test data matrix (double)
	% Ytest : N-by-1 label vector (unit8) for Xtest
	% epsilon : a scalar variable (double) for covariance regularisation
	
	numSamples = size(Xtest,1);
	
	tic
	[Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
	time = toc;
	fprintf('Number of test samples: %d\n',numSamples);
	fprintf('User time taken in seconds: %.2f\n',time);
	[cm, acc] = comp_confmat(Ytest,Ypreds(:,1));
	fprintf('Accuracy: %.4f\n',acc);
	fprintf('Number of wrongly classified test samples: %d\n',numSamples-sum(diag(cm)));
	save('task2_5_cm.mat','cm');
	M10 = Ms(10,:);
	Cov10 = reshape(Covs(10,:,:),784,784);
	save('task2_5_m10.mat','M10');
	save('task2_5_cov10.mat','Cov10');
	
	
	
	end