setdemorandstream(391418381)

%time: 56,5s
[net,tr] = train(net,X,t,'useParallel','yes','useGPU','yes');

%time: 100,20s
%[net,tr] = train(net,X,t); 

%time: 166,5s
%[net,tr] = train(net,X,t,'useParallel','yes','useGPU','only');