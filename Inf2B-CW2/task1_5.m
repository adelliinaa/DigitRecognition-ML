function task1_5(X, Ks) 

for k = 1 : size(Ks,2)
    
    [C, idx,SSE] = my_kMeansClustering(X, Ks(k), X(1:Ks(k), :), 100);
    save(sprintf("task1_5_c_%d.mat", Ks(k)), "C");
    save(sprintf("task1_5_idx_%d.mat", Ks(k)), "idx");
    save(sprintf("task1_5_SSE_%d.mat", Ks(k)), "SSE");
    %print(figure(k),sprintf('task1_5_SSE_class%d.pdf', Ks(k)),'-dpdf');
    
end