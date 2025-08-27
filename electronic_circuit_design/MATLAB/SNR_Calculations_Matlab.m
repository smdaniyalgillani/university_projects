[x,Fs_x] = audioread('D:\System\Desktop\Final_Submission_CEP\AudioFile\Trumpet_AMP_Filtered.WAV');
[y,Fs_y] = audioread('D:\System\Desktop\Final_Submission_CEP\AudioFile\trumpet.wav');
[z,Fs_z] = audioread('D:\System\Desktop\Final_Submission_CEP\AudioFile\whitenoise.wav');

% Make sure the signals have the same length
min_length = min(length(y), length(z));
z = z(1:min_length);
y = y(1:min_length);

% Calculate SNR
snr_original = snr(y, y - z);
snr_filtered = snr(x);

% Display the SNR value
fprintf('SNR_initial: %.2f dB\n', snr_original);
fprintf('SNR_filtered: %.2f dB\n', snr_filtered);
