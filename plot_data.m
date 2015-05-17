function [] = plot_data(RANKS, size_ratios, errors, TITLE)

%error_ratios = size_ratios ./ errors;

figure;
plotyy(RANKS, size_ratios, RANKS, errors, 'plot', 'plot');
%plotyy(RANKS, size_ratios, RANKS, error_ratios, 'plot', 'plot');

xlabel('Rank');
%legend('size ratios', 'relative errors');
legend('size ratios', 'error to size ratio');
title(TITLE);