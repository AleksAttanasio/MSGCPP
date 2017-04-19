clear all
clc

name = '1day_150x150_00'

load(name);
sz = size(values,1);
n_days = size(values,3);
cellInput = cell(1,n_days);

for i = 1:1:n_days
   
    cellInput{i} = values(:,:,i);
    
end

clear i n_days sz

load('gpu_set')
save(name)
