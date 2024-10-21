clc;
clear;

image = "town";
qualityLevel = 99;
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

psnr = PSNR(compressedIm, Im);
text = sprintf("Peak Signal to Noise Ration = %0.2f",round(psnr,2));
disp(text);
figure;
subplot(1, 3, 1);
imshow(Im);
title("The Original Image")

subplot(1, 3, 2);
imshow(compressedIm);
title(sprintf('The Compressed, quality level = %d, zeros: %.2f%%', qualityLevel, zerosPercentage));

% This is to plot a graph between the comrpression and the quality level
% May take a little more time
% qua_levels = 10:20:90;
% zero_vals = [];
% for qualityLevel = qua_levels
%     [compressedIm, zerosPercentage] = compressImage(Im, qualityLevel);
%     zero_vals = [zero_vals, zerosPercentage];
% end
% subplot(1, 3, 3);
% plot(qua_levels, zero_vals);
% title("Number of zeros vs. Quality level");
% xlabel("Quality Level");
% ylabel("Numebr of Zeros");



