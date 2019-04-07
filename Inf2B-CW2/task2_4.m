function [Corrs] = task2_4(Xtrain, Ytrain)

	Corrs = zeros(11,1);
	[EVecs, EVals] = comp_pca(Xtrain);
	projectedPoints = (EVecs(:,1:2)' * Xtrain')';
	numClasses = 10;
	for i=1:numClasses
	     classElements = projectedPoints(find(Ytrain==i-1),:);
	     covM = myCov(classElements, myMean(classElements));
	     Corrs(i) = covM(1,2)/sqrt(covM(1,1)*covM(2,2)); 
	end
	covM = myCov(projectedPoints, myMean(projectedPoints));
	Corrs(11) = covM(1,2)/sqrt(covM(1,1)*covM(2,2)); 
	
	end