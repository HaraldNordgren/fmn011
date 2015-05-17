function [] = intens(M, img_title)

imagesc(round(M));
axis image;
colormap(gray);

title(img_title)
xlabel 'Column index'
ylabel 'Row index'