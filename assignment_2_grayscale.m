function [RANKS, size_ratios, errors] = assignment_2_grayscale(nena)

FOLDER = 'nena_grayscale';
UNCOMPRESSED_IMAGE_PATH = [FOLDER, ...
    '/Nena_grayscale_uncompressed.jpg'];
FILE_NAME_START = 'Nena_grayscale_SVD_compressed_rank_';

SUPER_TITLE = 'Nena grayscale, SVD compression';
TITLE_START = 'Rank ';
CAPTION_START = 'Compression';
CAPTION_MIDDLE = 'ratio ';

RANKS = 2 .^ (7:8);

nena_grayscale = double(rgb2gray(nena));
imwrite(normalize_matrix(nena_grayscale), UNCOMPRESSED_IMAGE_PATH);
uncompressed_size = file_size(UNCOMPRESSED_IMAGE_PATH);

%Space allocation
rank_size = size(RANKS);
rank_indices = 1:rank_size(2);
size_ratios = RANKS;
errors = RANKS;

for k = rank_indices
    RANK_STRING = int2str(RANKS(k));
    FILE_NAME = create_image_path(FOLDER, strcat( ...
        FILE_NAME_START, RANK_STRING));
    FULL_TITLE = [TITLE_START, RANK_STRING];
    
    [compressed_image, size_ratios(k), errors(k)] = ...
        compress_and_create_image( nena_grayscale, ...
        RANKS(k), FILE_NAME, uncompressed_size);
    
    subplot(1,rank_size(2),k);
    imagesc(compressed_image);
    axis off;
    colormap(gray);
    title(FULL_TITLE);
    
    FULL_CAPTION = {CAPTION_START, [CAPTION_MIDDLE, num2str(size_ratios(k), 3)]};
    text(0.15, -0.05, FULL_CAPTION, 'Units', 'normalized')
end

suptitle(SUPER_TITLE)

nena_grayscale_table = generate_table(RANKS, size_ratios, errors)