function [Ypreds] = my_knn_classify(Xtrn, Ytrn, Xtst, Ks)

	N = size(Xtst, 1);
	L = size(Ks, 1);
	Ypreds = zeros(N, L);
	
	DI = myDistance(Xtst, Xtrn);
	
	[~, idx] = sort(DI, 2, 'ascend');
	
	for i=1:L
	k = Ks(i, 1);
	idx_neighbours = idx(:, 1:k); % get indices of the k nearest neighbours
	prediction = mode(Ytrn(idx_neighbours), 2);
	Ypreds(:, i) = prediction;
	end
	   
end 
