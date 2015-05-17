function [RANKS, size_ratios, errors] = assignment_2_color(nena, nena_size)

FOLDER = 'nena_color';
RANKS = 2 .^ (0:7);

SUPER_TITLE = 'Nena color, SVD compression';
TITLE_START = 'Rank ';
CAPTION_START = 'Compression';
CAPTION_MIDDLE = 'ratio ';

nena_double = double(nena);

%Space allocation
ranks_size = size(RANKS);
rank_indices = 1:ranks_size(2);
size_ratios = rank_indices;
errors = rank_indices;

loops = ranks_size(2);
F(loops) = struct('cdata',[],'colormap',[]);

figure;
set(gcf, 'Position', [0 0 926 597]);

for k = rank_indices
    [compressed_tensor, compressed_tensor_normalized, size_ratios(k), ...
        errors(k)] = compress_3_components(FOLDER, ...
        nena_double, nena_size, RANKS(k));
    
    movie_image = imresize(uint8(round(compressed_tensor)), 0.3);
    F(k) = im2frame(movie_image);
    
    subplot(2, ranks_size(2) / 2, k);
    imshow(imresize(compressed_tensor_normalized, 0.1));
    
    axis image;
    title([TITLE_START, int2str(RANKS(k))]);
    
    FULL_CAPTION = {CAPTION_START, [CAPTION_MIDDLE, num2str(size_ratios(k), 3)]};
    text(0.2, -0.12, FULL_CAPTION, 'Units', 'normalized')
end

suptitle(SUPER_TITLE);
generate_table(FOLDER, RANKS, size_ratios, errors);

%assignment_2_video(F, RANKS);