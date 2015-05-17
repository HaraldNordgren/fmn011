function [RANKS, size_ratios, errors] = assignment_2_color(nena, nena_size)

FOLDER = 'nena_color';

%RANKS = 1:2;
RANKS = 2 .^ (1:10);

SUPER_TITLE = 'Nena color, SVD compression';
TITLE_START = 'Rank ';
CAPTION_START = 'Compression';
CAPTION_MIDDLE = 'ratio ';

nena_double = double(nena);

%Space allocations
rank_size = size(RANKS);
rank_indices = 1:rank_size(2);
size_ratios = rank_indices;
errors = rank_indices;

loops = rank_size(2);
F(loops) = struct('cdata',[],'colormap',[]);

for k = rank_indices
    [compressed_tensor, compressed_tensor_normalized, size_ratios(k), ...
        errors(k)] = compress_3_components(FOLDER, ...
        nena_double, nena_size, RANKS(k));
    
    movie_image = imresize(uint8(round(compressed_tensor)), 0.3);
    F(k) = im2frame(movie_image);
    
    subplot(1, loops, k);
    imshow(imresize(compressed_tensor_normalized, 0.1));
    
    axis image;
    title([TITLE_START, int2str(RANKS(k))]);
    
    FULL_CAPTION = {CAPTION_START, [CAPTION_MIDDLE, num2str(size_ratios(k), 3)]};
    text(0.15, -0.15, FULL_CAPTION, 'Units', 'normalized')
end

suptitle(SUPER_TITLE);

nena_color_table = generate_table(RANKS, size_ratios, errors)

%assignment_2_video(F, RANKS);