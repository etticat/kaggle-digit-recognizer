%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

load('../tmp/nn_weights.mat');
load('../tmp/train_converted.mat');

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

h1 = nn_sigmoid([ones(m, 1) X] * Theta1');
h2 = nn_sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);

% =========================================================================



fprintf('\nTraining Set Accuracy: %f\n', mean(double(p == y)) * 100);