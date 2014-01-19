function [images, identifiers] = loadData(fileName)

file = fopen(fileName);
textscan(file, '%s', 28*28+1, 'delimiter', ',');
data = textscan(file, '%d', 'delimiter', ',');
fclose(file);
data = reshape(data{:}, 28*28+1, numel(data{:})/(28*28+1));
images = uint8(permute(reshape(data(2:end,:), [28 28 size(data,2)]), [2 1 3]));
identifiers = data(1,:)';

end
