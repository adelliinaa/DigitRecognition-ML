function [variances] = calc_Variances(X)
	%UNTITLED4 Summary of this function goes here
	%   Detailed explanation goes here
	
	means=calc_means(X);
	variances=sum(bsxfun(@minus,X,means).^2)./(size(X,1)-1);
	
	end
