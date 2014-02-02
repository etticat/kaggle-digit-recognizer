
% converts provided data into an format that is easily readable for Matlab


fprintf('Reading data ...\n')

file = fopen('../data/train.csv');
textscan(file, '%s', 28*28+1, 'delimiter', ',');
data = textscan(file, '%d', 'delimiter', ',');
fclose(file);
data = reshape(data{:}, 28*28+1, numel(data{:})/(28*28+1));
imagesTrain = double(permute(reshape(data(2:end,:), [28 28 size(data,2)]), [2 1 3]));
identifiersTrain = data(1,:)';

testFile = fopen('../data/test.csv');
textscan(testFile, '%s', 28*28, 'delimiter', ',');
testData = textscan(testFile, '%d', 'delimiter', ',');
fclose(testFile);
testData = reshape(testData{:}, 28*28, numel(testData{:})/(28*28));
imagesTest = double(permute(reshape(testData, [28 28 size(testData,2)]), [2 1 3]));

save('tmp/data.mat', 'imagesTrain', 'identifiersTrain', 'imagesTest');

fprintf('Convertion done ...\n')
