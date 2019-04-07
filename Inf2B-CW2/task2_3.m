function task2_3(X, Y)

	[EVecs, EVals] = comp_pca(X);
	projectedPoints = (EVecs(:,1:2)' * X')';
	numClasses = 10;
	numPoints = size(projectedPoints,1);
	
	for i=1:numClasses
	    classElements = projectedPoints((Y==i-1),:);
	    if(size(classElements,1)>2)
	        plotgauss2D(myMean(classElements)',myCov(classElements, myMean(classElements)));
            hold on;
	    end
	end
	
	end