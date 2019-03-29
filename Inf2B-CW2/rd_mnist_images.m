function [images, header] = rd_mnist_images(fname)
    fid = fopen(fname, 'r', 'ieee-be');
    header = fread(fid, 4, 'long=>long');
    n_images = header(2);
    height = header(3);
    width = header(4);
    
    bsize = height * width;
    [images, count] = fread(fid, [bsize, n_images], 'uchar=>uchar');
    images = images';
   %printf('rd_mnist_images(%)s: %d in, %d out \n', fname, n_images, count/bsize);
    fclose(fid);
end
