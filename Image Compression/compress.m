function B_tilde = compress(block_8by8, qualityLevel)
% ** This function compresses an 8 by 8 matrix according to the 'qualityLevel'

% cast the matrix into double    
formattedBlock = double(block_8by8);
B = formattedBlock -128; % Levelled off by subtracting 128
C = dct2(B);
% Quantization Matrix for the given 'qualityLevel'
Qn = Q_mat(qualityLevel); 
% Element-wise division by 'Qn', rounding, and then multiply
% by 'Qn' again and finally, add the 128 back to the inverse transformed matrix.
S = round(C./Qn);
R = S.*Qn;
B_tilde = idct2(R) + 128;

end