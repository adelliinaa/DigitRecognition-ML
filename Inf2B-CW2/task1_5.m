function task1_5(X, Ks) 

for i = 1 : length(Ks)
    k = Ks(i);
    [C, idx,SSE] = my_kMeansClustering(X, k, X(1:k, :), 50);
    save(sprintf("task1_5_c_%d.mat", k), "C");
    save(sprintf("task1_5_idx_%d.mat", k), "idx");
    save(sprintf("task1_5_SSE_%d.mat", k), "SSE");
end