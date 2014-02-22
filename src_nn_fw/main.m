clc;
clear;


num_labels = 10;
scaled_labels = num_labels;

imageRescaling = 0; 
cap  = 0;

netName = 'pattern_50_20';
net = patternnet([50 20]);
net.divideParam.trainRatio = 100/100;
net.divideParam.valRatio = 0/100;
net.divideParam.testRatio = 0/100;

convertData;
        
parseFeatures;
train;
predict;
predictValidation;