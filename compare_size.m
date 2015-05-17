function ratio = compare_size(original_size, file)

d = dir(file);
ratio = d.bytes / original_size;