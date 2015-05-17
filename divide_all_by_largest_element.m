function M_norm = divide_all_by_largest_element(M)

max_val = max(M(:));
M_norm = M / max_val;