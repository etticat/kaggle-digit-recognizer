p = net(X_validation');

m = max(p);

maxIndex = find(p == m);


[C,I] = max( p, [], 2 );
I = I-1;
csvwrite('tmp/submission.csv', [[1:size(I)]' I ]);