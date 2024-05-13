% Define the sampling frequency and time vector
fs = 5000; % Sampling frequency (Hz)
t = 0:1/fs:0.005; % Time vector (1 second duration)

% Generate the input wave
wave = 2+cos(2*pi*500*t) + cos(2*pi*1000*t);

% Design an elliptic low-pass filter
fc = 1500; % Cutoff frequency (Hz)
rp = 40; % Passband ripple (dB)
rs = 50; % Stopband attenuation (dB)
[N, Wn] = ellipord(fc/(fs/2), fc*1.2/(fs/2), rp, rs); % Order and cutoff frequencies
[b, a] = ellip(N, rp, rs, Wn); % Elliptic filter coefficients

% Convert to cascade IIR filter form
sos = tf2sos(b, a); % Second-order sections (SOS) representation

% Apply the cascade IIR filter to the input wave
filtered_wave = sosfilt(sos,wave);

% Plot the input and filtered waves
% figure;
% plot(t, wave, 'b', t, filtered_wave, 'r');
% legend('Input Wave', 'Filtered Wave');
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Input and Filtered Waves');

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
%plot(t,filtered_wave);
fopen("wave.txt", 'w');  % Open the file for writing

for i = 1:length(wave)-1
    fixed_point_number = fi(wave(i), 1, 16, 11);  % Convert to fixed-point representation
    binary_representation = bin(fixed_point_number);  % Convert to binary string
    fprintf(fopen("wave.txt", 'a'), '%s\n', binary_representation);  % Write binary string to file
end
fclose('all');  % Close all open files
