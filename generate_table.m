function[] = generate_table(RANKS, size_ratios, errors)
table(RANKS', size_ratios', errors', ...
    'VariableNames',{'SVD_compression_rank' 'Size_ratio' 'Error'})