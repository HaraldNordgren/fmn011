function [] = intens(M, img_title)

imagesc(round(M));
axis image;
%axis xy;
axis off;
colormap(gray);

title(img_title)
%xlabel 'Column index'
%ylabel 'Row index'

matrix_size = size(M);
set(gca, 'YTick', 1:matrix_size(2));
set(gca, 'XTick', 1:matrix_size(2));