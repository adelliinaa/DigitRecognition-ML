dir = '/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1728470';
[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dir);
[EVecs, EVals, CumVar, MinDims] = task1_3(Xtrn);
Xtrn2 = double(Xtrn)./255.0;
Ytrn2 = double(Ytrn)./255.0;
Xtst2 = double(Xtst)./255.0;
%Ypreds2 = double(Ypreds)./255.0;
%comp_pca(Xtrn);
%task1_1(Xtrn, Ytrn);
%[val, vect] = comp_pca(Xtrn);
%task1_3(Xtrn);
%task1_4(EVecs);
%Ks = [1,3,5];
%[Ypreds] = my_knn_classify(Xtrn2, Ytrn2, Xtst2, Ks);
%K = 10;
%[CM, acc] = comp_confmat(Ytrn2, Ypreds2, K);

my_kMeansClustering(Xtrn2, 5, Xtrn(1:5,:), 40);