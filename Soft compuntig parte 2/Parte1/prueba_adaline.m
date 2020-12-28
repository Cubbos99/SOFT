% Batch Training of ADALINE (Static Network)
% Concurrent inputs and targets:
p = [[1;1] [1;-1]];
t = [1 -1];
% Net architecture
net = linearlayer(0,0.25);
net.biasConnect = 0;
net = configure(net,p,t);
% Weights initialization
net.IW{1,1} = [0 0];
% train the network in batch mode
net.trainParam.epochs = 20;
net = train(net,p,t);
%train is used for batch training
% Simulate the Net
a = sim(net,p)
% The new weights after applying all input vectors are:
w = net.iw{1,1} % w=[0 1]
% Error calculation
e = a-t % e = 1.0e-06 * [-0.9537  0.9537]