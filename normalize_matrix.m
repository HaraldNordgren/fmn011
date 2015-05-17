function M_norm = normalize_matrix(M)

max_val = max(M(:));
M_norm = M / max_val;