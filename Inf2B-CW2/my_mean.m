function [mean] = myMean(matrix)

r = size(matrix, 1);

mean = sum(matrix)/r;

end