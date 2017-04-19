% loading Dataset 

load data_april2016_50X50


% digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos',...
%     'nndatasets','DigitDataset');
% digitData = datastore(digitDatasetPath,...
%         'IncludeSubfolders',true,'LabelSource','foldernames');
    

% show data
% figure;
% perm = randperm(10000,20);
% for i = 1:20
%     subplot(4,5,i);
%     imshow(digitData.Files{perm(i)});
% end

% split the Dataset

trainingNumFiles = 750;
rng(1) % For reproducibility
[trainDigitData,testDigitData] = splitEachLabel(digitData,...
				trainingNumFiles,'randomize');
            
% Define network structure
layers = [  imageInputLayer([28 28 1])      ;
            convolution2dLayer(5,20)        ;
            reluLayer()                     ;
            maxPooling2dLayer(2,'Stride',2) ;
            fullyConnectedLayer(10)         ;
            softmaxLayer()                  ;
            classificationLayer()   ]       ;
        
% Training Network

options = trainingOptions('sgdm','MaxEpochs',20,...
	'InitialLearnRate',0.0001);

convnet = trainNetwork(trainDigitData,layers,options);

% Classification (but we will do prediction)
YTest = classify(convnet,testDigitData);
TTest = testDigitData.Labels;

accuracy = sum(YTest == TTest)/numel(TTest);