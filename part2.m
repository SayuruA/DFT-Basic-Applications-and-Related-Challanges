Fs = 128;      % Sampling frequency in Hz
duration = 14; % Duration in seconds
N = Fs * duration; % Total number of samples

t = (0:N-1) / Fs;  % Time vector from 0 to duration with N points

% Frequencies for the harmonics (in Hz)
f1 = 5;    % Fundamental frequency
f2 = 10;   % Second harmonic
f3 = 15;   % Third harmonic
f4 = 20;   % Fourth harmonic

% Amplitudes for each harmonic
A1 = 1;    % Amplitude of the first harmonic
A2 = 0.8;  % Amplitude of the second harmonic
A3 = 0.6;  % Amplitude of the third harmonic
A4 = 0.4;  % Amplitude of the fourth harmonic

% Generate the signal with 4 harmonics
signal = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t) + A4*sin(2*pi*f4*t);

% Plot the generated signal
figure;

%plot(t, signal);
%title('Generated Signal with 4 Harmonics');
%xlabel('Time (s)');
%ylabel('Amplitude');

sgnls = transpose( reshape( signal(1:133), [133 1]));% Samples divided into subsets of 128
X_N  = fft(sgnls, [], 2);
%X_Avg = sum(X_N, 1)/ size(X_N, 1);

stem(abs(X_N(1,:))); % Magnitude
title('Averaged DFT');
xlabel('Frequency Index');
ylabel('Magnitude');
