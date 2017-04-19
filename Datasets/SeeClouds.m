clear all, clc

load 1day_20x20_00

figure
n = size(values);
n = n(3);

for i = 1:1:n
    
    img = values(:,:,i);
    pause(0.1)
    imshow(img)
    colormap winter
    
end

