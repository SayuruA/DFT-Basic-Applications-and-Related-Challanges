function psnr = PSNR(compressedIm, Im)
% This finds the Peak Signal to Noise Ratio in compressedIm with respect to
% Im.
% Change the 'phi' value if the image format in not 'uint8'
phi = 255; % Largest possible value for uint

% cast to a higher precision for 
compressedIm = double(compressedIm);
Im = double(Im);

err = compressedIm - Im;
sigma2 = err.^2;
sigma2 = mean(mean(sigma2));

psnr  = 10*log10((phi^2)/sigma2);