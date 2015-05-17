function [] = assignment_2_video(F, RANKS)

VIDEO_FOLDER = 'video';
TITLE_START = '/nena_svd_compression_ranks_';
FRAME_RATE = 6;

RANKS_FIRST = int2str(RANKS(1));
RANKS_DIFF = int2str(RANKS(2) - RANKS(1));
RANKS_LAST = int2str(RANKS(end));
RANKS_FOR_TITLE = [RANKS_FIRST, ':', RANKS_DIFF, ':', RANKS_LAST];
VIDEO_PATH = [VIDEO_FOLDER, TITLE_START, RANKS_FOR_TITLE, ...
    '_framerate_', int2str(FRAME_RATE), '.avi'];

myVideo = VideoWriter(VIDEO_PATH);
myVideo.FrameRate = FRAME_RATE;

open(myVideo);
writeVideo(myVideo, F);
close(myVideo);