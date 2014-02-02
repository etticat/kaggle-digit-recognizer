
load('tmp/data.mat');

fprintf('Parsing features...\n')

input_layer_size  = size(imagesTrain, 1) *  size(imagesTrain, 2);  % 28x28 Input Images of Digits
sampleSize_train  = size(imagesTrain, 3);  % Amounth of samples in training set
sampleSize_test  = size(imagesTest, 3);  % Amounth of samples in test set

X_train= double(reshape(imagesTrain,[input_layer_size sampleSize_train])');
X_test= double(reshape(imagesTest,[input_layer_size sampleSize_test])');
y_train = identifiersTrain+1;


fprintf('Saving features...\n')

save('tmp/converted.mat', 'X_train', 'y_train', 'input_layer_size', 'sampleSize_train', 'X_test');