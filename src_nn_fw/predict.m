testX = X(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY);
testIndicesT = vec2ind(testT);

correct_numbers = sum(testIndices ==testIndicesT);
totalNumbers = size(testIndices,2);

fid = fopen('result.csv', 'a+');
fprintf(fid, '\n%f;%f;%s;%f;%f\n', ...
    imageRescaling, cap, netName, (correct_numbers / totalNumbers), imageCleaning);
fprintf('\n%f;%f;%s;%f;%f\n', ...
    imageRescaling, cap, netName, (correct_numbers / totalNumbers),imageCleaning);
fclose(fid);
