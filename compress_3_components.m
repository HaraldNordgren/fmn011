function [compressed_image, compressed_image_normalized, ...
    size_ratio, error_median] = compress_3_components(FOLDER, ...
    uncompressed_image, uncompressed_size, rank)

COMPONENTS = 3;
FILE_NAME = '/nena_compressed_rank_';

%Space allocation
compressed_image = uncompressed_image;
compressed_image_normalized = uncompressed_image;
error_sum = 0;

for i = 1:COMPONENTS
    uncompressed_component = uncompressed_image(:,:,i);
    compressed_component = svd_compression(uncompressed_component, rank);
    compressed_image_normalized(:,:,i) = ...
        normalize_matrix(compressed_component);
    compressed_image(:,:,i) = compressed_component;
    
    error_sum = error_sum + matrix_relative_error( ...
        uncompressed_component, compressed_component);
end

error_median = error_sum / COMPONENTS;

file_name = create_image_path(FOLDER, strcat(FILE_NAME, int2str(rank)));
imwrite(compressed_image_normalized, file_name);

size_ratio = compare_size(uncompressed_size, file_name);