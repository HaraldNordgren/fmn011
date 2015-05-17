function [ratio, E] = sub(M, FOLDER, UNCOMPRESSED_PATH, rank)

compressed_matrix = svd_compression(M, rank);

subplot(2,2,rank+1)
caption = ['SVD compression, rank ', int2str(rank)];
intens(compressed_matrix, caption);

comp_norm = normalize_matrix(compressed_matrix);
file = filename(FOLDER, strcat('rank', int2str(rank)));
imwrite(comp_norm, file);

d = dir(UNCOMPRESSED_PATH);
original_size = d.bytes;

ratio = compare_size(original_size, file);
E = norm(M - compressed_matrix);