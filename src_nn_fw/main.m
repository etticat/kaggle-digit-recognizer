clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%different lables 0-9 => 10
num_labels = 10;

% 1 if images should be scaled to the maximum size
imageRescaling = 0; 

% If and at which pint the intensity should be capped
% 0: for no capping (Normal values from 0 to 255
% 1-255: all values below the value will get 0 and the ones above get 1
cap  = 0;

% If we are currently doing a submission or if we just test on our training
% set
submission = false;

% name of Algorith (For logging in csv)
netName = 'pattern_50_20';

%network settings
net = patternnet([50 20]);

% uncomment this for disabling test and validation sets (for submissions)
if(submission)
    net.divideParam.trainRatio = 100/100;
    net.divideParam.valRatio = 0/100;
    net.divideParam.testRatio = 0/100;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%% DATA PARSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%converts the provided csv and saves it into mat files which are easier to
%read by matlab
convertData;



%%%%%%%%%%%%%%%%%%%%%%%% FEATURE ENHANCING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TODO clean images here


% rescaling images
if(imageRescaling  == 1)
    imagesTrain= rescaleImage(imagesTrain);
end

% capping images 
if(cap ~= 0)
    imagesTrain = imagesTrain > cap;
end


%%%%%%%%%%%%%%%%%%%%%%%% FEATURE SIZE CONVERSION %%%%%%%%%%%%%%%%%%%%%%%%%%

% converts the provided Data into a usable 42000x768 matrix
parseFeatures;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRAINING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%training neural network
train;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% VALIDATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(~submission)
    %predicting on our own testset and evaluets value (Only if they are
    %activated)
    predict;
else
    %predict validation Values for submissions
    predictValidation;
end