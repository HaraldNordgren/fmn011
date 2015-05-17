function size = file_size(PATH)
file = dir(PATH);
size = file.bytes;