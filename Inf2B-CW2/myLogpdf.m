function [logp] = myLogpdf(mu,sigma,x,epsilon)
    
    [N,D] = size(x);
	sigma = sigma + epsilon*eye(size(sigma,1));
    c = -0.5 * D * log(2*pi);
	xc = bsxfun(@minus,x,mu);
	logp = (-0.5*sum((bsxfun(@minus,x,mu)/sigma).*bsxfun(@minus,x,mu) , 2))'+(c-0.5*logdet(sigma));

end

