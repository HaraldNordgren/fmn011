function [A_compressed, ratio, error] = ...
    compress_and_create_image(A, k, FILE_NAME, uncompressed_size)

A_compressed = svd_compression(A, k);
imwrite(divide_all_by_largest_element(A_compressed), FILE_NAME);

ratio = compression_ratio(uncompressed_size, FILE_NAME);
error = matrix_relative_error(A, A_compressed);