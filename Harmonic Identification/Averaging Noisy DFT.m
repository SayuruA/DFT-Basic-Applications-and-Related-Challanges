% Change only the loaded s_N and K value for different results
clc;
clear;
s_N = load('signal41.mat').xn_test;% All noisy 1793 samples as a contiguos array
K = 128;%sample size
L = floor(length(s_N)/ K);%number of sets of size K

% Samples divided into 'L' number of subsets of size 'K'
sgnls = transpose( reshape( s_N(1:K*L), [K L]));
% Take FFT of each row of X_N
X_N  = fft(sgnls, [], 2);

% Averaged DFT
figure(1);
X_Avg = sum(X_N, 1)/ size(X_N, 1);
stem(abs(X_Avg)); % Magnitude
% Separate the highest four peaks
hold on;
sorted_magX = sort(abs(X_Avg), 'descend');  % Sort magnitudes in descending order
threshold = sorted_magX(9)+1;           % The 4th highest peak
yline(threshold, 'r--','Harmonics are Above');  % Plot a red dashed line

title(['Averaged DFT with K = ', num2str(K)]);
xlabel('Frequency Index');
ylabel('Magnitude');

% To find the minimum number of subsets required 
figure(2);
for i = 1:L
    X_N_i  = X_N(1:i,:);
    X_Avg = sum(X_N_i, 1)/ size(X_N_i, 1);
    subplot(3,5,i);
    stem(abs(X_Avg)); % Magnitude
    title(['Avg of ', num2str(i), ' sets']);
    xlabel('Frequency Index');
    xlim([0 floor((K+1)/2)]);
    ylabel('Magnitude');
end
 hold off;
