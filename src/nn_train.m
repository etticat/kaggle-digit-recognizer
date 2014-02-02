
clear ; close all; clc


%% Setup the parameters you will use for this exercise
input_layer_size  = 784;  % 28x28 Input Images of Digits
training_sample_size  = 42000;  % Amounth of samples
hidden_layer_size = 100;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)
max_iterations = 1000;
lambda = 1;

initial_Theta1 = nn_randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = nn_randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
                          
fprintf('Reading data ...\n')

load('../tmp/train_converted.mat');


fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', max_iterations);


% Create "short hand" for the cost function to be minimized
costFunction = @(p) nn_costFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[nn_params, cost] = nn_fmincg(costFunction, initial_nn_params, options);
 
% Obtain Theta1 and Theta2 back from nn_params 1
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

             
             
save('../tmp/nn_weights.mat', 'Theta1', 'Theta2');
