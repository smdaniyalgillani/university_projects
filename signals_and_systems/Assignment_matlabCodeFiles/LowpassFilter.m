file="Audio.wav";
[y0,Fs0]=audioread(file);
N0  = length(y0);         %Number of Samples
Ts0 = 1/Fs0;              %Sampling Interval
t0=linspace(0,N0/Fs0,N0); %Duration of Signal/Time interval
fr0=t0/N0;
%---------------------------------------------------------------
%Lowpass Filter
y_low=filter(Lowpass,y0);
%-------------------Plot in DFT Frequency-time domain---------------
figure(1);
hold on;
plot(t0,abs(fft(y0)));
title('Original Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');

plot(t0,abs(fft(y_low)));
title('Original (Orange) vs Lowpass Filtered Signal (Blue)');
xlabel('Frequency');
ylabel('Magnitude');
hold off;