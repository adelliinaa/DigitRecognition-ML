function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)

	numSamples = size(Xtest,1);
	for i=1:size(Ks,2)
	tic
	Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest,Ks(i));
	time = toc;
	fprintf('Number of nearest neighbours: %d \n',Ks(i));
	fprintf('Number of test samples: %d\n',numSamples);
	fprintf('User time taken in seconds: %.2f\n',time);
	[cm, acc] = comp_confmat(Ytest,Ypreds(:,1), 10);
	fprintf('Accuracy: %.4f\n',acc);
	fprintf('Number of wrongly classified test samples: %d\n',numSamples-sum(diag(cm)));
	save(sprintf('task2_1_cm%d.mat',Ks(i)));
	    
	end

	
	end