function [sq_dist] = square_dist(A, B)

N = size(A,1)
M = size(B,1)
XX = sum(A.*A, 2);
YY = sum(B.*B, 2);
sq_dist = repmat(XX, 1, M) + (repmat(YY, 1, N)).';

end

