function [] = assignment_2_grayscale(nena, RANKS)

FOLDER = 'nena_grayscale';
UNCOMPRESSED_IMAGE_PATH = [FOLDER, ...
    '/Nena_grayscale_uncompressed.jpg'];
FILE_NAME_START = 'Nena_grayscale_SVD_compressed_rank_';

FIGURE_TITLE = 'Nena grayscale, SVD compression';
SUBPLOT_TITLE_START = 'Rank ';
SUBPLOT_CAPTION_START = 'Compression';
SUBPLOT_CAPTION_MIDDLE = 'ratio ';

nena_grayscale = double(rgb2gray(nena));
imwrite(divide_all_by_largest_element(nena_grayscale), UNCOMPRESSED_IMAGE_PATH);
uncompressed_size = file_size(UNCOMPRESSED_IMAGE_PATH);

%Space allocation
rank_size = size(RANKS);
rank_indices = 1:rank_size(2);
size_ratios = RANKS;
errors = RANKS;

figure;
set(gcf, 'Position', [0 0 926 597]);

for k = rank_indices
    RANK_STRING = int2str(RANKS(k));
    FILE_NAME = create_image_path(FOLDER, strcat( ...
        FILE_NAME_START, RANK_STRING));
    FULL_TITLE = [SUBPLOT_TITLE_START, RANK_STRING];
    
    [compressed_image, size_ratios(k), errors(k)] = ...
        compress_and_create_image( nena_grayscale, ...
        RANKS(k), FILE_NAME, uncompressed_size);
    
    subplot(2, rank_size(2)/2, k);
    intens(compressed_image, FULL_TITLE);
    
    FULL_CAPTION = {SUBPLOT_CAPTION_START, ...
        [SUBPLOT_CAPTION_MIDDLE, num2str(size_ratios(k), 3)]};
    text(0.2, -0.12, FULL_CAPTION, 'Units', 'normalized');
end

suptitle(FIGURE_TITLE)

generate_table(FOLDER, RANKS, size_ratios, errors);
plot_data(RANKS, size_ratios, errors, 'Nena grayscale SVD compression');