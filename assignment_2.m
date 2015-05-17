COLOR_UNCOMPRESSED_PATH = 'nena.jpg';

nena = imread(COLOR_UNCOMPRESSED_PATH);
file = dir(COLOR_UNCOMPRESSED_PATH);
nena_size = file.bytes;

%[grayscale_ranks, grayscale_size_ratios, grayscale_errors] = assignment_2_grayscale(nena);
[color_ranks, color_size_ratios, color_errors] = assignment_2_color(nena, nena_size);