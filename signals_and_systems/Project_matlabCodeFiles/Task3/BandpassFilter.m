file="Audio.wav";
[y0,Fs0]=audioread(file);
N0  = length(y0);         %Number of Samples
Ts0 = 1/Fs0;              %Sampling Interval
t0=linspace(0,N0/Fs0,N0); %Duration of Signal/Time interval
fr0=t0/N0;
%---------------------------------------------------------------
%BandPassFilter 2048-16384Hz Filter
y_audible=filter(Bandpass,y0);
%Amplified:
y_amped=y_audible*1.25;
%-------------------Plot in DFT Frequency-time domain-----------