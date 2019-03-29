function [] = task1_update(X, Y)

pic_matrix = zeros(28, 28, 10);
for i = 1 : 10
    A = X(Y ==(i-1),:);
    for b = 1 : 10
    B = (reshape(A(b,:), 28, 28))';
    pic_matrix (:,:,b)= B;
    end
colormap 'gray';
figure; 
montage(mat2gray(pic_matrix));
end

end