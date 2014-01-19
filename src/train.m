
clear ; close all; clc

fprintf('Reading data ...\n')
[digit_images, identifiers] = loadData('../data/train.csv');


fprintf('show random example digit\n')

randomImage = randi([0, 4200]);
showDigit(digit_images(:,:,randomImage));
fprintf('showing digit %d: %d\n', randomImage, identifiers(randomImage,:));

pause;