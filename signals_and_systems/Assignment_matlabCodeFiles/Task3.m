file="Audio.wav";
[y0,Fs0]=audioread(file);

N0  = length(y0);         %Number of Samples
Ts0 = 1/Fs0;              %Sampling Interval
t0=linspace(0,N0/Fs0,N0);   %Duration of Signal/Time interval
fr0=t0/N0;
%---------------------Plot in Time Domain and DFT--------------
%-----------------------Plot in Time Domain--------------------
figure(1);
subplot(2,1,1);
plot(t0,y0);
title('Original Audio Signal in Time Domain');
xlabel('Time (s)');
ylabel('Audio Signal Amplitude');
%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr0,abs(fft(y0)));
title('Original Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');
%-----------------------------Filtering--------------------------
%Lowpass
y_low=filter(Lowpass,y0);
%-----------------------------------------------------------
figure(2);
subplot(2,1,1);
plot(t0,y_low);
title('Lowpass Filtered Audio Signal in Time Domain');
xlabel('Time (s)');
ylabel('Audio Signal Amplitude');

%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr0,abs(fft(y_low)));
title('Lowpass Filtered Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');
%-----------------------------------------------------------------
%Bandstop 16-256Hz
y_bandstop=filter(Bandstop,y0);
%-----------------------------------------------------------
figure(3);
subplot(2,1,1);
plot(t0,y_bandstop);
title('Bass Filtered Audio Signal in Time Domain');
xlabel('Time (s)');
ylabel('Audio Signal Amplitude');

%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr0,abs(fftshift(fft(y_bandstop))));
title('Bass Filtered Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');


%---------------------------------------------------------------
%Bandpass 2048-16384Hz
y_bandpass=filter(Bandpass,y0);
%Amplification/Amplitude scaling
y_amped=y_bandpass*1.25;
%-----------------------------------------------------------
figure(4);
subplot(2,1,1);
plot(t0,y_amped);
title('Bass Filtered Audio Signal in Time Domain');
xlabel('Time (s)');
ylabel('Audio Signal Amplitude');

%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr0,abs(fft(y_amped)));
title('Bass Filtered Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');


%sound(y0,Fs0);
%sound(y_low,Fs0);
%sound(y_bandstop,Fs0);
