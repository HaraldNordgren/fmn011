function [] = generate_table(FOLDER, RANKS, size_ratios, errors)

error_ratios = errors ./ size_ratios;

SIZE_RATIO_STRINGS = arrayfun(@(x) num2str(x, 3), ...
    size_ratios, 'uniformoutput', false);
ERROR_STRINGS = arrayfun(@(x) num2str(x, 2), ...
    errors, 'uniformoutput', false);
ERROR_RATIO_STRINGS = arrayfun(@(x) num2str(x, 2), ...
    error_ratios, 'uniformoutput', false);

data_table = table(RANKS', SIZE_RATIO_STRINGS', ERROR_STRINGS', ERROR_RATIO_STRINGS', ...
    'VariableNames',{'SVD_compression_rank' 'Compression_ratio' ...
    'Relative_error' 'Error_to_compression_ratio'})

data_table_path = ['data_tables/', FOLDER, '_compression.csv'];
writetable(data_table, data_table_path);