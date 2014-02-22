
load('tmp/data.mat');

%fprintf('Parsing features...\n')

input_layer_size  = size(imagesTrain, 1) *  size(imagesTrain, 2);  % 28x28 Input Images of Digits

sampleSize_train  = size(imagesTrain, 3);  % Amounth of samples in training set
sampleSize_validation  = size(imagesTest, 3);  % Amounth of samples in test set

identifiersTrain = identifiersTrain+1;

X = double(reshape(imagesTrain,[input_layer_size sampleSize_train])')';
t = identifiersTrain';

X_validation = double(reshape(imagesTest,[input_layer_size sampleSize_validation])');

identityMatrix = eye(num_labels);
t = identityMatrix(t,:)';

%fprintf('Saving features...\n')

input_layer_size = size(X,2);
save('tmp/converted.mat', 'X', 't', 'X_validation');