
load('tmp/data.mat');

fprintf('Parsing features...\n')

input_layer_size  = size(imagesTrain, 1) *  size(imagesTrain, 2);  % 28x28 Input Images of Digits
sampleSize_train  = size(imagesTrain, 3);  % Amounth of samples in training set
sampleSize_test  = size(imagesTest, 3);  % Amounth of samples in test set

X_train= double(reshape(imagesTrain,[input_layer_size sampleSize_train])' > 128);
X_test= double(reshape(imagesTest,[input_layer_size sampleSize_test])');
y_train = identifiersTrain+1;



% Adding feature intensity 
intensity = sum(X_train,2);
X_train = [X_train intensity];
intensity = sum(X_test,2);
X_test = [X_test intensity];

fprintf('Saving features...\n')

input_layer_size = size(X_train,2);
save('tmp/converted.mat', 'X_train', 'y_train', 'input_layer_size', 'sampleSize_train', 'X_test');