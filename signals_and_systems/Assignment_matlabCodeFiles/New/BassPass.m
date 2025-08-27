audio="Audio1.wav";
[Ys,Fs]=audioread(audio);



%DFT conversion:
fft_Ys=(fftshift(fft(Ys)));
fft_Y_bass=(fftshift(fft(Y_bass)));


%Plot:
figure(1)
title ('Magnitude-time graph of signal')

plot(Ys,t,Y_bass,t);

figure(2)
title ('DDFT graph of signal')

stem(fft_Ys,fr,fft_Y_bass,fr);
