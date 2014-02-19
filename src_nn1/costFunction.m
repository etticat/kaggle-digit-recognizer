function [J grad] = costFunction(params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


% Feedforward
 
 
X = [ones(m, 1) X];        % fill first collumns of X with ones generating a 5000 x 401 Matrix
							
							%y contains values from 1 to 10 at this point
identityMatrix = eye(num_labels);
y = identityMatrix(y,:);  % Creates an 10x10 identity matrix and Sets Values to 1 or 0
							%  depending on which value is in y for this row. Example y(49) = 4 Result for 49. Row:
							% 0 0 0 1 0 0 0 0 0 0
 
a1 = X;
						% Theta1 is a 25x401 MAtrix Because our 2. layer (the only hidden layer) has 25 units and receives Data from the input layer (400 units + bias unit). It contains the weights of the hidden layer.
z2 = a1 * Theta1';		% z2 now contains a 5000x25 matrix containing the Values of the 	
						% hidden layer.
a2 = sigmoid(z2);		% a2 now contains the normalized Values of the hidden layer (z2)
						% this matrix has the same size as z2 but contains values from 0 to 1 depending on the size of the actual value in z2. Example z2(10) => a2(1) or z2(4) => a2(0.73)
 
n = size(a2, 1);		% n=5000 number of examples each unit contains
a2 = [ones(n,1) a2];	% Adds a column of 5000 ones to a2 making it a matrix with size 5000x26
  
						% Theta2 is a 10x26 MAtrix Because our 3. layer (the output layer) 10 units (Values 0-9) and receives data from the hidden layer with 25 units + bias unit.  It contains the weights of the output layer.
						
z3 = a2 * Theta2';		% z2 now contains a 5000x10 matrix containing the Values of the 	
						% hidden layer.
a3 = sigmoid(z3);		% normalized version of z3
  
J = ((1/m) * sum(sum((-y .* log(a3))-((1-y) .* log(1-a3))))); % assume a3 = hthetha(x)k

% Add regularisation  
  
regularization = (lambda/(2*m)) * (sum(sum((Theta1(:,2:end)).^2)) + sum(sum((Theta2(:,2:end)).^2)));
J = J + regularization;
  
  
%Backpropagation

% Step 1: Nothing to do here. Would only be neccessary if Implementation was not vectorized

%Step 2:
delta_3 = a3 - y;		% y indicates if the training example belongs to the current class (1 || 0)


%Step 3:
delta_2 = (delta_3 * Theta2(:,2:end)) .* sigmoidGradient(z2);
						% NOTE: We do not want to use the bias unit of Theta2
 

%Step 4
delta_cap2 = delta_3' * a2; %Accumulate the gradient
delta_cap1 = delta_2' * a1;

% Step 5 (Without Regularisation)
Theta1_grad = ((1/m) * delta_cap1); 
Theta2_grad = ((1/m) * delta_cap2); 

%Regularisation

Theta1_grad = Theta1_grad + ((lambda/m) * (Theta1)); % Regulizes Theta1_grad
Theta2_grad = Theta2_grad + ((lambda/m) * (Theta2));
 
Theta1_grad(:,1) = Theta1_grad(:,1) - ((lambda/m) * (Theta1(:,1))); % resets the regularisation of the first column
Theta2_grad(:,1) = Theta2_grad(:,1) - ((lambda/m) * (Theta2(:,1)));




% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
