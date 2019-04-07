function Dmap = task2_6(Xtrain, Ytrain, epsilon, MAT_evecs, MAT_evals, posVec, nbins)

load(MAT_evecs,'EVecs');
load(MAT_evals,'EVals');
numSamples = size(Xtrain,1);
mean = myMean(Xtrain); % row vector
Y1 = EVecs(:,1); %column vector
Y2 = EVecs(:,2);
numGridPoints = nbins*nbins;
% The means are the projection of the mean onto the 2 principal components
meanY1 = mean*Y1;
meanY2 = mean*Y2;
varY1 = EVals(1,:);
varY2 = EVals(2,:);
Y1plot = linspace(meanY1-5*sqrt(varY1),meanY2+5*sqrt(varY1), nbins)';
Y2plot = linspace(meanY1-5*sqrt(varY2),meanY2+5*sqrt(varY2), nbins)';
% Obtain the grid vectors for the two dimensions
[Y1v Y2v] = meshgrid(Y1plot, Y2plot);
grid2D = [Y1v(:), Y2v(:)]; % Concatenate to get a 2-D point.			  
%Dmap = grid2D;
% Revert projection into D-Space 
projectedGridPoints = zeros(numGridPoints,784);
for i=1:numGridPoints
    projectedGridPoints(i,:) = (EVecs*padarray(grid2D(i,:),[0 782], 'post')'+posVec')'; % Orthogonality of EVecs implies that the inverse of EVecs is EVecs'
end

%Gaussian Classification
[Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, projectedGridPoints, 0.01);
classesOfPoints = Ypreds(:,1);
    
Dmap = permute(reshape(classesOfPoints,nbins,nbins),[2 1]);
Dmap = uint8(Dmap);
% This function will draw the decision boundaries
figure
[CC,h] = contourf(Y1plot(:), Y2plot(:),reshape(classesOfPoints, length(Y1plot), length(Y2plot)));
set(h,'LineColor','none');


end