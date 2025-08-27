%---------------------ReadAudio--------------------------------
file="Audio.wav";
[y0,Fs0]=audioread(file);
%---------------------AudioPrintinfo---------------------------
info = audioinfo(file);
%--------------------------------------------------------------
N  = length(y0);         %Number of Samples
Ts = 1/Fs0;              %Sampling Interval
t=linspace(0,N/Fs0,N);   %Duration of Signal/Time interval
fr=t/N;
%---------------------Plot in Time Domain and DFT--------------
%-----------------------Plot in Time Domain--------------------
figure(1);
subplot(2,1,1);
plot(t,y0);
title('Original Audio Signal in Time Domain');
xlabel('Time (s)');
ylabel('Audio Signal y');
%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr,abs(fft(y0)));
title('Original Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');
%----------------------------------------------------------------

%Subsampling:
Fs1=Fs0/2;
Audiosub=tempname(file);
subfile='Audiosub.wav';
audiowrite(subfile, y0, Fs0);
y1=resample(y0,1,2);
info1=audioinfo("Audiosub.wav");
audiowrite(subfile,y1,Fs1);
clear y1 Fs1;
[y1,Fs1]=audioread(subfile);
%----------------------------------------------------------------
N1=length(y1);
Ts1 = 1/Fs1;              %Sampling Interval
t1=linspace(0,N1/Fs1,N1);   %Duration of Signal/Time interval
fr1=t1/N1;
%-----------------------Plot in Time Domain--------------------
figure(2);
subplot(2,1,1);
plot(t1,y1);
title('Audio Signal in time domain');
xlabel('Time (s)');
ylabel('Audio Signal y');
%--------------------------Plot in DFT--------------------------
subplot(2,1,2);
stem(fr1,abs(fft(y1)));
title('Audio Signal in DFT');
xlabel('Frequency Range');
ylabel('Magnitude');
%----------------------------------------------------------------
%sound(y0,Fs0);
%sound(y1,Fs1);