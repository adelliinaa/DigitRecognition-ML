function [] = task1_1(X, Y)

	sol=zeros(10,10,784);
	top=ones(10,1);
	counter=1;
	
	for i=1:size(X)
	    if top(Y(i)+1)<=10
	       sol(Y(i)+1,top(Y(i)+1),:)=X(i,:);
	       top(Y(i)+1)=top(Y(i)+1)+1;
	       counter=counter+1;
	    end
	    if counter == 101
	        break
        end
    end
%       for n = 1:10
%       for m = 1:10 
%       montage(sol(1,m,:))
%       end
%       end
    
	current={};
	aux=zeros(28,28);
	img={};
		for i=1:10
            
	    for j=1:10
            
	      aux=toMatrix(sol(i,j,:));  
	      aux=mat2gray(aux);
	      current=[current,aux];
        end
        
	    img=[img,current];
	    current={};
	img=montage(img);
        end
        
	end



