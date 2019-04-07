function [cov_matrix] = myCov(matrix, mean)


r = size(matrix, 1);
cov_subtract = bsxfun(@minus, matrix, mean);
cov_subtract  = cov_subtract.' * cov_subtract;
cov_subtract = cov_subtract/r;
cov_matrix = cov_subtract.';

end