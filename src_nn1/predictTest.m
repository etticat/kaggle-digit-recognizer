%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

load('tmp/weights.mat');
load('tmp/converted.mat');

p = predict(Theta1, Theta2, X_test)-1;


load('tmp/data.mat');


for j=1:10,
    randomImage = randi([0, size(p, 1)]);
    showDigit(imagesTest(:,:,randomImage));
    fprintf('showing digit %d: %d\n', randomImage, p(randomImage,:));
    pause;
end

% A line for header has to be added for submission
csvwrite('tmp/submission.csv', [[1:size(p)]' p ]);