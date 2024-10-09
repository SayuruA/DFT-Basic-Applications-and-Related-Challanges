clc;
clear;

imageName = 
Barb = load("Selected-Images\Parrots.mat").B;

[M, N] = size(Barb); % the number of rows and columns of the image
qualityLevel = 50;

compressedBarb = zeros([M,N]);
totalZeros = 0;

for row = 1: 8: M
    
    for col = 1: 8: N
        
        imageBlock = Barb(row: row+7, col: col+7);
        [compressedBlock, Zeros] = compress(imageBlock, qualityLevel);
        compressedBarb(row: row+7, col: col+7) = compressedBlock;
        totalZeros = totalZeros + Zeros;
        
    end
end
compressedBarb = uint8(round(compressedBarb));
zeroRatio = round(totalZeros/ numel(Barb) * 100, 1);


figure;
subplot(1, 2, 1);
imshow(Barb);
title("The Original Image")

subplot(1, 2, 2);
imshow(compressedBarb);
title(sprintf('The Compressed, quality level = %d, zeros: %.2f%%', qualityLevel, zeroRatio));



