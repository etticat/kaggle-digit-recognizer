clear ; close all; clc

fid = fopen('result.csv', 'w');
fprintf(fid, 'train;test;lambda;hiddenLayer;iterations;imageRescaling;\n');
fclose(fid);
convertData;

lambdaTrys = [.1 .3 .7 1 1.3 1.5 2 3 4 5 10];
hidden_layer_sizeTrys = [3 5 10 25 50 100 200];
max_iterationsTrys = [5 10 20 50 100 500 1000];
imageRescalingTrys = [0 1]; % If image rescaling should be done => 1 or 0 if yes or no
capTrys = [0 100 128 160 200]; % If image intensity should be caped

for  max_iterations = max_iterationsTrys
    for hidden_layer_size = hidden_layer_sizeTrys
        for lambda = lambdaTrys
            for imageRescaling = imageRescalingTrys
                for cap = capTrys
                    parseFeatures;
                    train;
                    predictTrain;
                end
            end
        end
    end
end