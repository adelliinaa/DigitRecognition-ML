
function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
	% Input:
	%   Xtrain : M-by-D training data matrix (double)
	%   Ytrain : M-by-1 label vector for Xtrain (uint8)
	%   Xtest  : N-by-D test data matrix (double)
	%   epsilon : A scalar parameter for regularisation (double)
	%   L      : scalar (integer) of the number of Gaussian distributions per class
	% Output:
	%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
	%  MMs     : (L*K)-by-D matrix of mean vectors (double)
	%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)
	
	
	numClasses = 10;
	[numTrain, dimTrain] = size(Xtrain);
	[numTest, dimTest] = size(Xtest);
	MMs = zeros(numClasses*L,dimTrain);
	MCovs = zeros(numClasses*L,dimTrain,dimTrain);
	
	%Learn parameters
	clusIndex = 0;
	for i=1:numClasses
	    classElements = Xtrain((Ytrain==(i-1)),:);
	    [C, idx, SSE] = my_kMeansClustering(classElements, L, classElements(1:L,:));
	     
	    for clus=1:L
	        MMs(clusIndex+clus,:) = C(clus,:);
	        classClusterElements = classElements(idx==clus);
	        MCovs(clusIndex+clus,:,:) = myCov(classClusterElements);
	    end
	    clusIndex = clusIndex + L;
	end
	
	
	%Classification
	logProbMatrix = zeros(numClasses*L,numTest);
	for i=1:numClasses*L
	   logProbMatrix(i,:) = myLogpdf(MMs(i,:),reshape(MCovs(i,:,:), [dimTrain,dimTrain]), Xtest, epsilon);
	 end
	
	[maxV,maxI] = max(logProbMatrix);
	Ypreds = (ceil(maxI / L) - ones(1,numTest))'; %Subtract 1 since working with labels zero
	
	
	
	end
	
