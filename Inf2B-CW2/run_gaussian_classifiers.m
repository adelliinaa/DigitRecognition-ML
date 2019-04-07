function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)

	numClasses = 10;
	[numTrain, dimTrain] = size(Xtrain);
	[numTest, dimTest] = size(Xtest);
	Ms = zeros(numClasses,dimTrain);
	Covs = zeros(numClasses,dimTrain,dimTrain);
	
	%Learn parameters
	for i=1:numClasses
	    classElements = Xtrain((Ytrain==i-1),:);
	    Ms(i,:) = myMean(classElements);
	    Covs(i,:,:) = myCov(classElements, myMean(classElements));
	end
	
	
	%Classification
	logProbMatrix = zeros(numClasses,numTest);
	for i=1:numClasses
	    logProbMatrix(i,:) = myLogpdf(Ms(i,:),reshape(Covs(i,:,:), [dimTrain,dimTrain]), Xtest, epsilon);
	end
	
	[maxV,maxI] = max(logProbMatrix);
	Ypreds = (maxI - ones(1,numTest))'; 
	
	end
