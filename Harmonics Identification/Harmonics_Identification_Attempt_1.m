s_N = load('signal41.mat').xn_test;% All noisy 1793 samples as contiguos array
sgnls = transpose( reshape( s_N(1:1792), [256 7]));% Samples divided into subsets of 128

figure;
for i = 1:3
    X = fft( sgnls( i, :));
    subplot(2, 2, i);
    stem(abs(X)); % Magnitude
    title(['FFT of subset ', num2str(i)]);
    xlabel('Frequency Index');
    ylabel('Magnitude');
    hold on;
end


X_N  = fft(sgnls, [], 2);
X_Avg = sum(X_N, 1)/ size(X_N, 1);
subplot(2, 2, 4);
stem(abs(X_Avg)); % Magnitude
title(['Averaged DFT']);
xlabel('Frequency Index');
ylabel('Magnitude');

