function task2_1(Xtrn, Ytrn, Xtest, Ytest, Ks)

load('/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1728470/data.mat');
	
	% Feature vectors: Convert uint8 data to double, and divide by 255.
	Xtrn = double(dataset.train.images) ./ 255.0;
	Xtst = double(dataset.test.images) ./ 255.0;
	% Labels
	Ctrn = dataset.train.labels;
	Ctst = dataset.test.labels;
	
	%YourCode - Prepare measuring time
	tic
	
	% Run K-NN classification
	Ks = [1,3,5,10,20];
	Cpreds = my_knn_classify(Xtrn, Ytrn, Xtst, Ks.');
	
	%YourCode - Measure the time taken, and display it.
	toc
	
	%YourCode - Get confusion matrix and accuracy for each k in kb.
	for i=1: length(Ks)
	k = Ks(i);
	[cm,acc] = comp_confmat(Ytst, Ypreds(:, i), k);
	    
	    %YourCode - Save each confusion matrix.
	fname = sprintf ( '%s%i', 'cm', k );
	save(fname, 'cm');
	
	    %YourCode - Display the required information - k, N, Nerrs, acc for
	    % each element of kb.
	display = sprintf('K: %d, N: %d, Number of errors: %d, Accuracy: %.4f', k, size(Xtst,1), sum(sum(cm)) - trace(cm), acc);
	disp(display);
	    
	end