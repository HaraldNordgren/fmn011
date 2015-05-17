load A;

FOLDER = 'A_matrix';
UNCOMPRESSED_PATH = [FOLDER, '/Uncompressed.jpg'];
FILE_NAME_START = 'A_matrix_grayscale_SVD_compression_rank_';
FIGURE_TITLE_START = 'Matrix A grayscale,';
FIGURE_TITLE_MIDDLE = 'SVD compression rank ';

CAPTION_START = 'Compression ratio ';

RANKS = 1:3;

figure;
set(gcf, 'Position', [0 0 634 638]);

ranks_size = size(RANKS);
subplot_width = (ranks_size(2) + 1) / 2;
subplot(2, subplot_width, 1)

intens(A, {FIGURE_TITLE_START, 'No compression'});
imwrite(divide_all_by_largest_element(A), UNCOMPRESSED_PATH);
uncompressed_size = file_size(UNCOMPRESSED_PATH);

%Space allocation
errors = RANKS;
size_ratios = RANKS;

for k = RANKS
    RANK_STRING = int2str(k);
    FULL_TITLE = {FIGURE_TITLE_START, [FIGURE_TITLE_MIDDLE, RANK_STRING]};
    
    FILE_NAME = create_image_path(FOLDER, [FILE_NAME_START, RANK_STRING]);
    [A_compressed, size_ratios(k), errors(k)] = ...
        compress_and_create_image(A, k, FILE_NAME, uncompressed_size);
    
    subplot(2, subplot_width, k+1);
    intens(A_compressed, FULL_TITLE);
    
    FULL_CAPTION = [CAPTION_START, num2str(size_ratios(k), 3)];
    text(0.15, -0.1, FULL_CAPTION, 'Units', 'normalized')
end

generate_table(FOLDER, RANKS, size_ratios, errors);