
load('tmp/data.mat');

%fprintf('Parsing features...\n')

input_layer_size  = size(imagesTrain, 1) *  size(imagesTrain, 2);  % 28x28 Input Images of Digits


% rescaling images
if(imageRescaling  == 1)
    for i=1:input_layer_size
        imagesTrain(:,:,i) = rescaleImage(imagesTrain(:,:,i));
    end
end
if(cap ~= 0)
    imagesTrain = imagesTrain > cap;
end

sampleSize_train  = size(imagesTrain, 3);  % Amounth of samples in training set
sampleSize_validation  = size(imagesTest, 3);  % Amounth of samples in test set
sampleSize_test  = 8400;  % Amounth of samples in test set

identifiersTrain = identifiersTrain+1;

trainSet= double(reshape(imagesTrain,[input_layer_size sampleSize_train])');
X_train = trainSet(1:sampleSize_train-sampleSize_test,:);
X_test = trainSet(sampleSize_train-sampleSize_test:end,:);
y_train = identifiersTrain(1:sampleSize_train-sampleSize_test,:);
y_test = identifiersTrain(sampleSize_train-sampleSize_test:end,:);
sampleSize_train = sampleSize_train-sampleSize_test;

X_validation = double(reshape(imagesTest,[input_layer_size sampleSize_validation])');

%fprintf('Saving features...\n')

input_layer_size = size(X_train,2);
save('tmp/converted.mat', 'X_train', 'y_train', 'y_test', 'input_layer_size', 'sampleSize_train', 'X_test', 'X_validation');