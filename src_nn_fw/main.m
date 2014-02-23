%clc;
%clear;
tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CONFIG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%config;

fprintf('Config finished at time %f\n' , toc); tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%% DATA PARSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%converts the provided csv and saves it into mat files which are easier to
%read by matlab
%convertData;

fprintf('Parsing finished at time %f \n' , toc);tic;



%%%%%%%%%%%%%%%%%%%%%%%% FEATURE ENHANCING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('tmp/data.mat');

% rescaling images
if(imageRescaling)
    imagesTrain = rescaleImage(imagesTrain);
end

if(imageCleaning)
    for i=1: size(imagesTrain,3)
        imagesTrain(:,:,i) = medfilt2(imagesTrain(:,:,i));
    end
end

% capping images 
if(cap ~= 0)
    imagesTrain = imagesTrain > cap;
end


fprintf('Feature enhancing finished at time %f\n' , toc);tic;
%%%%%%%%%%%%%%%%%%%%%%%% FEATURE SIZE CONVERSION %%%%%%%%%%%%%%%%%%%%%%%%%%

% converts the provided Data into a usable 42000x768 matrix
parseFeatures;

fprintf('Feature size conversion finished at time %f\n' , toc);tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRAINING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%training neural network
train;

fprintf('Training finished at time %f\n' , toc);tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%% VALIDATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(~submission)
    %predicting on our own testset and evaluets value (Only if they are
    %activated)
    predict;
else
    %predict validation Values for submissions
    predictValidation;
end


fprintf('Validation finished at time %f\n' , toc);