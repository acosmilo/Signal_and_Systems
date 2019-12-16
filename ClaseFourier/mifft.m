function [  ] = mifft(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector

x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

y = x + 2*randn(size(t));

figure
stem(Fs*t(1:50),y(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')
grid

NFFT = 2^nextpow2(L);
Y=fft(y,NFFT);
f=Fs/2*linspace(0,1,NFFT/2+1);

figure
plot(f,abs(Y(1:NFFT/2+1)))
title('Single-Side Amplitude Spectrum of y(t)')
xlabel('Frecuency (Hz)')
ylabel('|Y(f)|')
grid
end

