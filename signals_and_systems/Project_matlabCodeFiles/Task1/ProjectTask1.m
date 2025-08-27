K=18;                   %Group number
L=3;                    %Common CMS number
N=10;                   %Total number of samples
n=0:N-1;                %Range of samples starting from 0
Range=-0.5:0.1:0.4;     %Frequency range
fr=Range/N;
%--------> Function declaration:
%-------------------------Function 1: x1_n------------------------------
x1= exp((1j*2*pi*n*(10*(K+1)))/100) + exp((1j*2*pi*n*33)/100);
%-------------------------Function 2: x2_n -----------------------------
x2= cos((2*pi*n*(10*(K+1)))/100) + (1/2)*cos(2*pi*n*(10*(L+1))/100);
%-----------------------------------------------------------------------
%-------------------------Plotting--------------------------------------

figure (1);

%Graph x1
subplot(2,1,1);
stem(fr,abs(fftshift(fft(x1))));
title('X1 Magnitude to Frequency');
xlabel('Frequency (fr)');
ylabel('Magnitude');

%Graph x2
subplot(2,1,2);
stem(fr,abs(fftshift(fft(x2))));
title('X2 Magnitude to Frequency');
xlabel('Frequency (fr)');
ylabel('Magnitude');

