clear all
clc

%% Dataset organization

addpath('../Datasets')
dataset_name = '7days_50x50_00';
load(dataset_name);

% % TEST ARRAY
% cellInput = cell(1, 672);
% 
% for i = 1:1:672
%    
%     cellInput{i} = i;
%     
% end

% Training Images dataset
num_intervals = 1; % numbers of previous images used to predict
cloudsTrainImages = cell(num_intervals,(size(cellInput,2)- num_intervals));
start_index = 1;
inner_index = 0;

for i = 1:1:size(cloudsTrainImages,2)
    
   for k = start_index:1:(num_intervals + start_index - 1)       
       inner_index = inner_index + 1;
       cloudsTrainImages{inner_index,i} = cellInput{k};
   end
   
   inner_index = 0;
   start_index = start_index + 1;   
end

% Training Images targets
cloudsTarget = cell(1,(size(cellInput,2)- num_intervals));

for i =  1:1:size(cloudsTrainImages,2)
    
    cloudsTarget{i} = cellInput{i + num_intervals}; 
    
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
          softmaxLayer
          classificationLayer];
      
options = trainingOptions('sgdm',...
      'LearnRateSchedule','piecewise',...
      'LearnRateDropFactor',0.2,... 
      'LearnRateDropPeriod',5,... 
      'MaxEpochs',1000);
  
trainedNet = trainNetwork(T,layers,options);





