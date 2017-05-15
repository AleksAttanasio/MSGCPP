clear all
clc

%% Dataset organization

addpath('../Datasets')
dataset_name = '7days_50x50_00';
load(dataset_name);

% cellInput = cell(1, 672);
% 
% for i = 1:1:672
%    
%     cellInput{i} = i;
%     
% end

% Training Images dataset
num_intervals = 10; % numbers of previous frames to predict
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

%% CNN Training


