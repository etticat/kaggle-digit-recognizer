clc;
clear;

%fid = fopen('result.csv', 'w');
%fprintf(fid, 'imageRescaling;cap;name;testAccuracy\n');
%fclose(fid);

num_labels = 10;

imageRescalingTrys = [0 1]; 
capTrys  = [0 128];

convertData;
        
netName = 'pattern_20_15';
net = patternnet([20 15]);
for imageRescaling = imageRescalingTrys
    for cap = capTrys
        parseFeatures;
        train;
        predict;
    end
end


netName = 'feedforwardnet_20_15';
net = feedforwardnet([20 15]);
net.efficiency.memoryReduction  = 4000;
for imageRescaling = imageRescalingTrys
    for cap = capTrys
        parseFeatures;
        train;
        predict;
    end
end


netName = 'cascadeforwardnet_20_15';
net = cascadeforwardnet([20 15]);
net.efficiency.memoryReduction  = 4000;
for imageRescaling = imageRescalingTrys
    for cap = capTrys
        parseFeatures;
        train;
        predict;
    end
end

netName = 'fitnet_20_15';
net = fitnet([20 15]);
for imageRescaling = imageRescalingTrys
    for cap = capTrys
        parseFeatures;
        train;
        predict;
    end
end


