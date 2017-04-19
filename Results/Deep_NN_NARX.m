laod ready_dataset_divided
x = train;
t = valid;


setdemorandstream(491218381)

net = narxnet(1:2,1:2,10);

[Xs,Xi,Ai,Ts] = preparets(net,x,{},t);