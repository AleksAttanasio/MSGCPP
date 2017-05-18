clear all
clc

%% Dataset organization

addpath('../Datasets')
dataset_name = '7days_20x20_00';
load(dataset_name);
num_intervals = 1; % numbers of previous images used to predict
window_size = size(cellInput{1},1);
temp_set = [];

% % TEST ARRAY cellInput = cell(1, 672);
% for i = 1:1:672
%     cellInput{i} = i;
% end

% Training Images dataset
cloudsTrain = [];
for i = 1:1:(size(cellInput,2) - num_intervals)
    
    for k = 0:1:(num_intervals - 1)
       
        temp_set = cat(3,temp_set,cellInput{i+k});
        
    end
    
    cloudsTrain = cat(4,cloudsTrain,temp_set);
    temp_set = [];
    
end

% Training Images targets
cloudsTarget = [];
for i = (num_intervals + 1):1:size(cellInput,2)
   
    cloudsTarget = cat(1,cloudsTarget,cellInput{i}(window_size/2,window_size/2));
        
end

clear i k temp_set

%% CNN Training

layers = [ ...
    imageInputLayer([window_size window_size 1])
    convolution2dLayer(3,25)
    maxPooling2dLayer(2)
    reluLayer
    convolution2dLayer(3,50)
    maxPooling2dLayer(2)
    reluLayer
    fullyConnectedLayer(1)
    regressionLayer];

options = trainingOptions('sgdm','InitialLearnRate',0.001, ...
    'MaxEpochs',1000, ...	
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.02, ...
    'LearnRateDropPeriod',3);
  
trainedNet = trainNetwork(cloudsTrain, cloudsTarget,layers,options);





