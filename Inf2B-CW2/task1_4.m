function task1_4(EVecs)

	img={}
	
	for i=1:10
	    aux=toMatrix(EVecs(i,:));
	    aux=mat2gray(aux);
	    img=[img,aux];
	end
	img=montage(img);
	img
    
	end