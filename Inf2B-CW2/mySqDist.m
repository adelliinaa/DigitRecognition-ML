function distanceMatrix = mySqDist(A,B,dimA,dimB)
ASqr = zeros(dimA,1);
BSqr = zeros(dimB,1);
for i=1:dimA
    ASqr(i,:) = A(i,:)*A(i,:)';
end
for i=1:dimB
    BSqr(i,:) = B(i,:)*B(i,:)';
end
distanceMatrix = repmat(ASqr,1,dimB) - 2*A*B' + repmat(BSqr,1,dimA)';