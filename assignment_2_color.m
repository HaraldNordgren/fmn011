function movie_frames = assignment_2_color(nena, nena_size, RANKS)

FOLDER = 'nena_color';

FIGURE_TITLE = 'Nena color, SVD compression';
SUBPLOT_TITLE_START = 'Rank ';
SUBPLOT_CAPTION_START = 'Compression';
SUBPLOT_CAPTION_MIDDLE = 'ratio ';

nena_double = double(nena);

%Space allocation
ranks_size = size(RANKS);
rank_indices = 1:ranks_size(2);
size_ratios = rank_indices;
errors = rank_indices;

total_frames = ranks_size(2);
movie_frames(total_frames) = struct('cdata',[],'colormap',[]);

figure;
set(gcf, 'Position', [0 0 926 597]);

for k = rank_indices
    [compressed_tensor, compressed_tensor_divided_by_largest, ...
        size_ratios(k), errors(k)] = compress_3_components(FOLDER, ...
        nena_double, nena_size, RANKS(k));
    
    movie_image = imresize(uint8(round(compressed_tensor)), 0.3);
    movie_frames(k) = im2frame(movie_image);
    
    subplot(2, ranks_size(2) / 2, k);
    imshow(imresize(compressed_tensor_divided_by_largest, 0.1));
    
    axis image;
    title([SUBPLOT_TITLE_START, int2str(RANKS(k))]);
    
    FULL_CAPTION = {SUBPLOT_CAPTION_START, ...
        [SUBPLOT_CAPTION_MIDDLE, num2str(size_ratios(k), 3)]};
    text(0.2, -0.12, FULL_CAPTION, 'Units', 'normalized');
end

suptitle(FIGURE_TITLE);

generate_table(FOLDER, RANKS, size_ratios, errors);
plot_data(RANKS, size_ratios, errors, 'Nena color SVD compression');