function [means] = calc_means(X)

	col_sum=sum(X);
	means=double(col_sum)./size(X,1);
	
end