function [labels, header] = rd_mnist_labels(fname)
    fid = fopen(fname, 'r', 'ieee-be');
    header = fread(fid, 2, 'long');
    labels = fread(fid, Inf, 'uchar=>uchar');
    fclose(fid);
end
