function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)

	numSamples = size(Xtest,1);
	
	tic
	[Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
	time = toc;
	fprintf('Number of test samples: %d\n',numSamples);
	fprintf('User time taken in seconds: %.2f\n',time);
	[cm, acc] = comp_confmat(Ytest,Ypreds(:,1));
	fprintf('Accuracy: %.4f\n',acc);
	fprintf('Number of wrongly classified test samples: %d\n',numSamples-sum(diag(cm)));
	save(sprintf('task2_8_cm_%d.mat',L),'cm');
	Ms1 = MMs(1:L,:);
	Covs1 = MCovs(1:L,:,:);
	
	save(sprintf('task2_8_g%d_m1.mat',L),'Ms1');
	save(sprintf('task2_8_g%d_cov1.mat',L),'Covs1');
	
end