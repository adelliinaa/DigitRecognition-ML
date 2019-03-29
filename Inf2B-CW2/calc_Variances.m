function [variances] = calc_Variances(X)

	means=calc_means(X);
	variances=sum(bsxfun(@minus,X,means).^2)./(size(X,1)-1);
	
end
