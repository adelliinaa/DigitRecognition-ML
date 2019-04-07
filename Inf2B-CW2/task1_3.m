function [EVecs, EVals, CumVar, MinDims] = task1_3(X)

	[EVecs,EVals]=comp_pca(X);
	
	%variances=calc_Variances(EVecs);
    CumVar=cumsum(EVals);
	
    MinDims=zeros(4,1);
	total=size(CumVar,2);
	figure
    plot((0:783), CumVar);
    
	for i=1:total
	    if CumVar(i)>=0.7*CumVar(total) && MinDims(1)==0
	        MinDims(1)=i;
        end
	    if CumVar(i)>=0.8*CumVar(total)  && MinDims(2)==0
	        MinDims(2)=i;
        end 
	    if CumVar(i)>=0.9*CumVar(total)  && MinDims(3)==0
	        MinDims(3)=i;
        end    	    
	    if CumVar(i)>=0.95*CumVar(total)  && MinDims(4)==0
	        MinDims(4)=i;
	        break
	    end
	end
	
	end