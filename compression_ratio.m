function ratio = compression_ratio(original_size, file)

d = dir(file);
ratio = original_size / d.bytes;