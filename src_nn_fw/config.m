%different lables 0-9 => 10
num_labels = 10;

% 1 if images should be scaled to the maximum size
imageRescaling = false; 

% cleaning images
imageCleaning = true;

% If and at which pint the intensity should be capped
% 0: for no capping (Normal values from 0 to 255
% 1-255: all values below the value will get 0 and the ones above get 1
cap  = 0;

% If we are currently doing a submission or if we just test on our training
% set
submission = false;

% name of Algorith (For logging in csv)
netName = 'pattern_50_30_20';

%network settings
net = patternnet([50 30 20]);
net.trainParam.min_grad = 1e-7;
net.trainParam.max_fail = 30;
%net.trainParam.time = 1000000000000;
net.trainParam.goal = 0.0000001;
net.trainParam.epochs = 10000;



% uncomment this for disabling test and validation sets (for submissions)
if(submission)
    net.divideParam.trainRatio = 100/100;
    net.divideParam.valRatio = 0/100;
    net.divideParam.testRatio = 0/100;
end