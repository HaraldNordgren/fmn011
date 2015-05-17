function [] = assignment_2(run_grayscale, run_color, run_video)

COLOR_UNCOMPRESSED_PATH = 'nena.jpg';

RANK_STEP = 8;
RANK_ROWS = 3;

nena = imread(COLOR_UNCOMPRESSED_PATH);
file = dir(COLOR_UNCOMPRESSED_PATH);
nena_size = file.bytes;

if run_grayscale
    %GRAYSCALE_RANKS = 2 .^ (1:10);
    GRAYSCALE_RANKS = 1:RANK_STEP:(2*RANK_STEP*RANK_ROWS);
    
    assignment_2_grayscale(nena, GRAYSCALE_RANKS);
end

if run_color
    COLOR_RANKS = 2 .^ (7:10);
    %COLOR_RANKS = 1:RANK_STEP:(2*RANK_STEP*RANK_ROWS);
    
    movie_frames = assignment_2_color(nena, nena_size, COLOR_RANKS);

    if run_video
        assignment_2_video(movie_frames, COLOR_RANKS);
    end
end