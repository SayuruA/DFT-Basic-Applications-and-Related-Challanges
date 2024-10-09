clc;
clear;


Barb = load("Selected-Images\barbara.mat").A;
testBlock = Barb(129:136, 161:168);
formattedBlock = double(testBlock);
B = formattedBlock -128; % Levelled off by subtracting 128
C = dct2(B);


Qn = Q_mat(80); % Quantization Matrix

S = round(C./Qn);
