


load('tmp/converted.mat');
net_size = [80,40,20];   %Change it for different network sizes. Each col...
                         %represents a Layer.

if(~exist('tmp/net.mat','file')) 
    inp_layer = [0 255];
    inp_layer = repmat(inp_layer, 784,1);
    digit_net=newff(inp_layer,[32 16],{'tansig' 'tansig' 'tansig'},'trainlm');
    digit_net.trainParam.epochs = 1;
    digit_net.trainParam.show = 10;
    save('Nnet.mat', 'digit_net');
end
y_target = y_train;
y_target = repmat(y_train,1,10);
a=[1 2 3 4 5 6 7 8 9 10];
a = repmat(a, 42000,1);
y_target = (y_target == a);
y_target = y_target';

X_inp = X_train';
for(i=1:42000)
    
X_stocInp = double(X_inp(:,i));
y_stocTar = double(y_target(:,i));
[digit_net,tr] = train(digit_net,X_stocInp,y_stocTar);

%save('net.mat');nntool

end