
% converts provided data into an format that is easily readable for Matlab


fprintf('Reading data ...\n')

[digit_images, identifiers] = loadData('../data/train.csv');

input_layer_size  = 784;  % 28x28 Input Images of Digits
training_sample_size  = 42000;  % Amounth of samples in training set

X= double(reshape(digit_images,[input_layer_size training_sample_size])');
y = identifiers+1;


fprintf('Converting and saving Data ...\n')

save('../tmp/train_converted.mat', 'X', 'y');

fprintf('Convertion done ...\n')
