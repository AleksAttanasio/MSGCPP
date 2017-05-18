clear all
clc

%% Dataset organization

addpath('../Datasets')
dataset_name = '7days_50x50_00';
load(dataset_name);
num_intervals = 10;

% % TEST ARRAY
% cellInput = cell(1, 672);
% 
% for i = 1:1:672
%    
%     cellInput{i} = i;
%     
% end

% Training Images dataset
cloudsTrain = cellInput{1};
for i = 2:1:size(cellInput,2)
    
   cloudsTrain = cat(4,cloudsTrain,cellInput{i});
    
end
% Training Images targets
% cloudsTarget = cell(1,(size(cellInput,2)- num_intervals));
cloudsTarget = cellInput{num_intervals};

for i = (num_intervals + 1):1:size(cellInput,2)
   
    cloudsTarget = cat(4,cloudsTarget,cellInput{i});
        
end


%% CNN designer

img_width = size(cloudsTarget{1},1);
img_height = size(cloudsTarget{1},2);

% layers = [imageInputLayer([img_width img_height 1])
%           convolution2dLayer(5,30)
%           reluLayer
%           maxPooling2dLayer(2,'Stride',2)
%           fullyConnectedLayer(img_width * img_height)];
      
      
T = table(cloudsTrainImages,cloudsTarget);
%% CNN Training

layers = [imageInputLayer([28 28 1])
          convolution2dLayer(5,20)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)
          fullyConnectedLayer(10)
          regressionLayer()];
      
options = trainingOptions('sgdm',...
      'LearnRateSchedule','piecewise',...
      'LearnRateDropFactor',0.2,... 
      'LearnRateDropPeriod',5,... 
      'MaxEpochs',1000);
  
trainedNet = trainNetwork(cloudsTrain, cloudsTarget,layers,options);





