function task1_8(X,Y)
	%Compute the Sum of Squared Error for the random distribution of the
	%initial centres
	
    init = zeros(10,size(X,2));
	
	for i=1:size(init,1)
        %choose the initial cluster centres randomly
	    init(i,:)=X(round(rand()*size(X,1)),:);
        
	end
	[~,~,SSE] = my_kMeansClustering(X,10,init,100);
	display(size(SSE,1));
end