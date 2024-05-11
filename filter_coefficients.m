% Define the sampling frequency and time vector
fs = 2000; % Sampling frequency (Hz)
t = 0:1/fs:0.05; % Time vector (1 second duration)

% Generate the input wave
wave = 2+cos(2*pi*500*t) + cos(2*pi*1000*t);

% Design a low-pass IIR filter
fc = 800; % Cutoff frequency (Hz)
[b, a] = butter(1, fc/(fs/2), 'low'); % 1st-order Butterworth low-pass filter

% % Apply the IIR filter to the input wave
filtered_wave = filter(b, a, wave);
% freq_axis = -(fs/2):(fs/length(wave)):(fs/2)-(fs/length(wave));

% % Plot the input and filtered waves
% subplot(4, 1, 1);
% stem(freq_axis, abs(fft(wave)), "filled");
% title('Input Wave (FFT)');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([-fs/2 fs/2]); % Set x-axis limits to show full frequency range

% subplot(4, 1, 2);
% stem(freq_axis, abs(fft(filtered_wave)), "filled");
% title('Filtered Wave (FFT)');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([-fs/2 fs/2]); % Set x-axis limits to show full frequency range
% subplot(4,1,3)
% plot(t,wave);
% subplot(4,1,4)
 plot(t,filtered_wave);
fopen("wave.txt", 'w');  % Open the file for writing

for i = 1:length(wave)-1
    fixed_point_number = fi(wave(i), 1, 16, 11);  % Convert to fixed-point representation
    binary_representation = bin(fixed_point_number);  % Convert to binary string
    fprintf(fopen("wave.txt", 'a'), '%s\n', binary_representation);  % Write binary string to file
end
fclose('all');  % Close all open files
