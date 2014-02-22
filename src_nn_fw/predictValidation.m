p = net(X_validation');
[C,I] = max( p, [], 2 );
I = I-1;
csvwrite('submission.csv', [[1:size(I)]' I ]);

fprintf('submission.csv created\n')