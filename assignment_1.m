load A;

FOLDER = 'A_matrix';
UNCOMPRESSED_PATH = [FOLDER, '/Uncompressed.jpg'];
FILE_NAME_START = 'A_matrix_grayscale_SVD_compression_rank_';

FIGURE_TITLE_START = 'Matrix A grayscale,';
FIGURE_TITLE_MIDDLE = 'SVD compression rank ';

RANKS = 1:3;

subplot(2,2,1)
intens(A, {FIGURE_TITLE_START, 'No compression'});

imwrite(normalize_matrix(A), UNCOMPRESSED_PATH);
uncompressed_size = file_size(UNCOMPRESSED_PATH);

%Space allocation
errors = RANKS;
size_ratios = RANKS;

for k = RANKS
    RANK_STRING = int2str(k);
    FULL_TITLE = {FIGURE_TITLE_START, [FIGURE_TITLE_MIDDLE, RANK_STRING]};
    
    FILE_NAME = create_image_path(FOLDER, strcat(FILE_NAME_START, RANK_STRING));
    [A_compressed, size_ratios(k), errors(k)] = ...
        compress_and_create_image(A, k, FILE_NAME, uncompressed_size);
    
    add_subplot(k+1, A_compressed, FULL_TITLE);
end

A_table = generate_table(RANKS, size_ratios, errors)