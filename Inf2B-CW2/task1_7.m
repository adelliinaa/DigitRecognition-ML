function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_EVecs, MAT_EVals, posVec, nbins)
    cmap = [0.80369089, 0.61814689, 0.46674357;
            0.81411766, 0.58274512, 0.54901962;
            0.58339103, 0.62000771, 0.79337179;
            0.83529413, 0.5584314 , 0.77098041;
            0.77493273, 0.69831605, 0.54108421;
            0.72078433, 0.84784315, 0.30039217;
            0.96988851, 0.85064207, 0.19683199;
            0.93882353, 0.80156864, 0.4219608;
            0.83652442, 0.74771243, 0.61853136;
            0.7019608 , 0.7019608 , 0.7019608];
    
    load(MAT_ClusterCentres, 'C');
    load(MAT_M, 'M');
    load(MAT_EVals, 'EVals');
    load(MAT_EVecs, 'EVecs');

    sizeMean = size(M);
    
    Mx = (M(sizeMean(1),:) - posVec) * EVecs(:,1);
    My = (M(sizeMean(1),:) - posVec) * EVecs(:,2);

    sizeC = size(C);
    std_x = sqrt(EVals(1)); %find standard deviations
    std_y = sqrt(EVals(2));
    
    A = zeros(sizeC(1),2);
    for c = 1:sizeC
        A(c,1) = C(c,:) * -1 * EVecs(:,1);
        A(c,2) = C(c,:) * -1 * EVecs(:,2);
    end

    Xplot = linspace(Mx - 5 * std_x, Mx + 5 * std_x, nbins)';
    Yplot = linspace(My - 5 * std_y, My + 5 * std_y, nbins)';
    
    % Obtain the grid vectors for the two dimensions
    
    [Xv Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
    Dmap = length(Xv(:));
    
    for i = 1:length(gridX) % Apply k-NN for each test point
        dists = square_dist(A, gridX(i, :))'; % Compute distances
        [d I] = min(dists);
        Dmap(i) = I;
    end
    figure;
    % This function will draw the decision boundaries
    [CC,h] = contourf(Xplot(:), Yplot(:), reshape(Dmap, length(Xplot), length(Yplot)));
    set(h,'LineColor','none');
    colormap(cmap); hold on;
end


function sq_dist = square_dist(U,v)
    sq_dist = sum(bsxfun(@minus, U, v).^2,2)';
end