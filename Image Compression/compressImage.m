function [compressedIm, zerosPercentage] = compressImage(Im, qualityLevel)
% ** This function takes an image and the desired quality level and produce
% the compressed image accordingly. Depends on 'compress.m'. Returns the
% compressed image and the zeros percentage of compression.

% the number of rows and columns of the image
[M, N] = size(Im); 
% initialize the final returns
compressedIm = zeros([M,N]);
totalZeros = 0;

% iterate through all the 8 by 8 blocks and apply 'compress' and store in 'compressedIm'
% also, count the zeors.
for row = 1: 8: M
    
    for col = 1: 8: N
        
        imageBlock = Im(row: row+7, col: col+7);
        [compressedBlock, Zeros] = compress(imageBlock, qualityLevel);
        compressedIm(row: row+7, col: col+7) = compressedBlock;
        totalZeros = totalZeros + Zeros;
        
    end
end

% format the compressedIm to uint8 and compute the zeros percentage
compressedIm = uint8(round(compressedIm));
zerosPercentage = round(totalZeros/ numel(Im) * 100, 1);

end