function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)

[n d]=size(Xtest);
MMs = zeros(10*L,d);
MCovs = zeros(10*L,d,d);
C=zeros(10*L,1);
for i=1:10
    X=Xtrain(Ytrain(:,1)==i-1,:);
    [~, id, ~] = my_kMeansClustering(X, L, X(1:L,:),100);
    idx=id';
    for j=1:L
        xj=X(idx(:,1)==j,:);
        MMs(L*(i-1)+j,:)=sum(xj)/size(xj,1);
        MCovs(L*(i-1)+j,:,:)=reshape(MyCovb(xj)+epsilon*eye(d),1,d,d);
        C(L*(i-1)+j,1)=size(xj,1);
    end
end
C(:,1)=C(:,1)/size(Xtrain,1);
l=zeros(n,10*L);
for i=1:10*L
    cov=reshape(MCovs(i,:,:),d,d);
    invcov = inv(cov);
    de=logdet(cov);
    save(sprintf('task2_8.mat'),'invcov');
    for j=1:n
        x=Xtest(j,:)-MMs(i,:);
        l(j,i)=-0.5*(x*invcov*x')-0.5*de+log(C(i,1));
    end
end
[~,idx1]=sort(l,2,'descend');
Ypreds=floor((idx1(:,1)-1)/L);
end

function X = MyCovb(X)
n=size(X,1);
u = sum(X)./n;
E = bsxfun(@minus,X,u);
X=1/n * (E' * E);
end