function Dmap = task2_2(Xtrain, Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)

	MAT_evecs2 = load(MAT_evecs); mevec = MAT_evecs2.EVecs;
	MAT_evals2 = load(MAT_evals); meval = MAT_evals2.EVals;
	
	m = sum(Xtrain)/size(Xtrain,1);
	Xplot = linspace(m(1)-5*sqrt(meval(1)), m(1)+5*sqrt(meval(1)), nbins)';
	Yplot = linspace(m(2)-5*sqrt(meval(2)), m(2)+5*sqrt(meval(2)), nbins)';
	[Xv, Yv] = meshgrid(Xplot, Yplot);
	grid = (mevec(:,1:2))*[Xv(:), Yv(:)]' + posVec';
	gridX = grid';

	[Dmap] = run_knn_classifier(Xtrain, Ytrain, gridX,k);

	[CC,h] = contourf(Xplot(:), Yplot(:), flip(flip(reshape(Dmap, length(Xplot), length(Yplot)),2)));
	set(h,'LineColor','none');
	
	save(sprintf('task2_2_dmap_%d.mat',k),'Dmap');
	
	end
	
	
