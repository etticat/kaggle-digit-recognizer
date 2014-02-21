%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

load('tmp/weights.mat');
load('tmp/converted.mat');

p = predict(Theta1, Theta2, X_train);

p2 = predict(Theta1, Theta2, X_test);

fid = fopen('result.csv', 'a+');
fprintf(fid, '\n%f,%f,%f,%f,%f,%f,%f,%f\n',mean(double(p == y_train)) * 100,  mean(double(p2 == y_test)) * 100, lambda, hidden_layer_size, max_iterations, imageRescaling, cap);
fclose(fid);

fprintf('\n%f,%f,%f,%f,%f,%f,%f,%f\n',mean(double(p == y_train)) * 100,  mean(double(p2 == y_test)) * 100, lambda, hidden_layer_size, max_iterations, imageRescaling, cap);

