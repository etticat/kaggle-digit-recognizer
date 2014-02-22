clc;
clear;

%fid = fopen('result.csv', 'w');
%fprintf(fid, 'imageRescaling;cap;name;testAccuracy\n');
%fclose(fid);

num_labels = 10;

imageRescalingTrys = [0 1]; 
capTrys  = [0 128];

%convertData;
        
netName = 'pattern_20_15';
net = patternnet([20 15]);
for imageRescaling = imageRescalingTrys
    for cap = capTrys
        parseFeatures;
        train;
        predict;
    end
end
