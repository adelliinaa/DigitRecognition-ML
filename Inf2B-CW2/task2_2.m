function Dmap = task2_2(X, Y, k, MAT_evecs, MAT_evals, posVec, nbins)

	    load(MAT_evecs,'EVecs');
	    load(MAT_evals,'EVals');
	    
	%% Initialisation
	    Dmap = zeros(nbins*nbins, 1);
	    [M D] = size(X);
	    plot = zeros(nbins*nbins, D);
	    
	    %% initialise the 2D plot plane in 784-D vector space
	    sd_X = sqrt(EVals(1,:)); sd_Y = sqrt(EVals(2,:));
	    mu = ( EVecs'*(myMean(X)-posVec)' )';
	    mu_X = mu(:,1);mu_Y = mu(:,2);
	    
	    Xplot = linspace(mu_X-5*sd_X, mu_X+5*sd_X, nbins)';
	    Yplot = linspace(mu_Y-5*sd_Y, mu_Y+5*sd_Y, nbins)';
	    [Xv, Yv] = meshgrid(Xplot, Yplot);
	    plot(:,1:2) = [Xv(:) Yv(:)];
	    
	    %% Apply pca to the 2D plane to convert it from principle component
	    %  coordinate system to the original coordinate system 
	    plot = bsxfun(@plus, (EVecs' \ plot')', posVec);
	    
        %% Perform knn classification in the original coordinate system
	    Dmap = run_knn_classifier(X, Y, plot, [k]);
	    Dmap = reshape(Dmap, nbins, nbins);
	    
	    %% 
	    colors = random_colours(10);
	    figure;
	    [CC,h] = contourf(Xplot(:), Yplot(:), Dmap);
	    set(h,'LineColor','none');
	    colormap(colors);
	
	%     save(sprintf('task2_2_dmap_%d.mat', k), 'Dmap');
	endnd