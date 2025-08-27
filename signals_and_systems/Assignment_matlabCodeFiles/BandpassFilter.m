file="Audio1.wav";
[Ys,Fs]=audioread(file);
N  = length(Ys);         %Number of Samples
Ts0 = 1/Fs;              %Sampling Interval
t=linspace(0,N/Fs,N); %Duration of Signal/Time interval
fr=t/N;
%---------------------------------------------------------------
%BassFilter 16-256Hz Filter
y_16_256Hz=filter(BassPass,Ys);
%-------------------Plot in DFT Frequency-time domain-----------
figure(1);
y0=abs(fftshift(fft(Ys)));
y1=abs(fftshift(fft(y_16_256Hz)));

hold on;
stem(abs(fftshift(fft(Ys))));
xlabel('Time(s)');
ylabel('Magnitude');

stem(abs(fftshift(fft(y_16_256Hz))));
title('Original (Orange) vs Bass Filtered Signal (Blue)');
xlabel('Frequency(Hz)');
ylabel('Magnitude');
hold off;