function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
	    %compute the PCA 
	    [m,d] = size(X);
	    [EVecs, EVals] = comp_pca(X);    
	    
	    save('task1_3_evecs.mat','EVecs');
	    save('task1_3_evals.mat','EVals');
	    
	    %compute the cumulative variance
	    CumVar = cumsum(EVals);
        figure
	    plot([1:d], CumVar)

	    MinDims = zeros(4, 1);
	    TotalVar = sum(EVals); 
	    ratio = [0.7 0.8 0.9 0.95];
	    for (i=1:4)
	        MinDims(i) = sum(CumVar < (ratio(i) * TotalVar)) + 1;
        end
	    save('task1_3_cumvar.mat','CumVar');
	    save('task1_3_mindims.mat','MinDims');
	    
	end
	
