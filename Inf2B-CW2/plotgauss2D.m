function plotgauss2D(meanVector,covM)

	%Lab 6, page 9
    %visualize the PDF of 2D Gaussian distributions for mean vectors and covariance matrices

    ls=linspace(0,2*pi,50)';
    x = cos(ls); 
    y=sin(ls);
    ap = [x(:) y(:)]';
    [v,d]=eig(covM); 
    d = sqrt(d); % 1 standard deviation 
    dp = (v*d*ap) + repmat(meanVector, 1, size(ap,2)); 
    plot(dp(1,:), dp(2,:), '-', 'parent', gca);
    hold on
end

