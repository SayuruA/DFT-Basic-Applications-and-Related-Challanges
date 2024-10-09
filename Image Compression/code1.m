clc;
clear;

image = "house";
qualityLevel = 97.5;
path = "Selected-Images\\";  
% get the required image matrix
% matrices of different image files are stored under different variable
% names inside their '.mat' files.
imageName = sprintf("%s%s.mat", path, image);
Im = load(imageName);
fieldname = fieldnames(Im);
Im = Im.(fieldname{1});

% compress the image and get the percentage of zeros
[compressedIm, zerosPercentage] = compressImage(Im, qualityLevel);


figure;
subplot(1, 2, 1);
imshow(Im);
title("The Original Image")

subplot(1, 2, 2);
imshow(compressedIm);
title(sprintf('The Compressed, quality level = %d, zeros: %.2f%%', qualityLevel, zerosPercentage));



