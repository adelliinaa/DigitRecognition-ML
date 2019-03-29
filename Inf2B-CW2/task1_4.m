function task1_4(EVecs)

	img={}
	
	for i=1:10
        aux = (reshape(EVecs(i,:), 28, 28));
	    aux=mat2gray(aux);
	    img=[img,aux];
    end
    figure
	img=montage(img);
	img
    
	end