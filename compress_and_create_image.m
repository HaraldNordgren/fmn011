function [A_compressed, ratio, error] = ...
    compress_and_create_image(A, k, FILE_NAME, uncompressed_size)

A_compressed = svd_compression(A, k);
imwrite(normalize_matrix(A_compressed), FILE_NAME);

ratio = compare_size(uncompressed_size, FILE_NAME);
error = matrix_relative_error(A, A_compressed);