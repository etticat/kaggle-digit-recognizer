
nn = loadSubmission('submissions/nn1_1.csv', 0.94514);
knn = loadSubmission('submissions/knn_benchmark.csv', 0.96557);
randomForrest = loadSubmission('submissions/rf_benchmark.csv', 0.96829);

totalSubmissions = nn + knn + randomForrest;


[maxVal maxInd] = max(totalSubmissions');
maxInd = maxInd';
maxInd = maxInd -1;

res = [[1:size(maxInd)]' maxInd ];
csvwrite('tmp/submission.csv', res);