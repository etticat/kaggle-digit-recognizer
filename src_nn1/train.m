
%clear ;
load('tmp/converted.mat');

%% Setup the parameters you will use for this exercise
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_params = [initial_Theta1(:) ; initial_Theta2(:)];
                          
%fprintf('Reading data ...\n')

clear options;
clear costFunction;
clear cost;
clear params;

%fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', max_iterations);


% Create "short hand" for the cost function to be minimized
costFunction = @(p) costFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X_train, y_train, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[params, cost] = fmincg(costFunction, initial_params, options);
 
% Obtain Theta1 and Theta2 back from params 1
Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

             
             
save('tmp/weights.mat', 'Theta1', 'Theta2');
