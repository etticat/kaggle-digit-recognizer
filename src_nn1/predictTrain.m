%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

load('tmp/weights.mat');
load('tmp/converted.mat');

p = predict(Theta1, Theta2, X_train);



fprintf('\nTraining Set Accuracy: %f\n', mean(double(p == y_train)) * 100);