function result = matrix_relative_error(A, A_compressed)
result = norm(A - A_compressed) / norm(A);