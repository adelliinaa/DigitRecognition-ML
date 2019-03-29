dir = '/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1728470';
[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dir);
[EVecs, EVals, CumVar, MinDims] = task1_3(Xtrn);
Xtrn2 = double(Xtrn)./255.0;
Ytrn2 = double(Ytrn)./255.0;
Xtst2 = double(Xtst)./255.0;
Ytst2 = double(Xtst)./255.0;
%Ypreds2 = double(Ypreds)./255.0;
%comp_pca(Xtrn);
%task1_1(Xtrn, Ytrn);
%[val, vect] = comp_pca(Xtrn);
%task1_3(Xtrn);
%task1_4(EVecs);
%Ks = [1,3,5];
%[Ypreds] = my_knn_classify(Xtrn2, Ytrn2, Xtst2, Ks);
%K = 10;
%[CM, acc] = comp_confmat(Ytrn2, Ypreds2, K);

	%Prepare measuring time
	tic
	%K-NN classification
	Ks = [1,3,5,10,20];
	[Ypreds] = my_knn_classify(Xtrn2, Ytrn2, Xtst2, Ks.');
	
	%Measure the time taken
	toc
	
	%Get confusion matrix and accuracy for each k in Ks
	for i= 1: length(Ks)
	k = Ks(i);
	[cm,acc] = comp_confmat(Ytst2, Ypreds(:, i), k);
	    
	    %Save each confusion matrix.
	fname = sprintf ( '%s%i', 'cm', k );
	save(fname, 'cm');
	
	    %Display the required information - k, N, Nerrs, acc for
	    % each element of kb.
	display = sprintf('K: %d, N: %d, Number of wrongly classified test samples: %d, Accuracy: %.4f', k, size(Xtst2,1), sum(sum(cm)) - trace(cm), acc);
	disp(display);
    end