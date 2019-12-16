%% Noisy Signal
% Use Fourier transforms to find the frequency components of a signal buried 
% in noise.
% 
% Specify the parameters of a signal with a sampling frequency of 1 kHz and
% a signal duration of 1 second.

% Copyright 2015 The MathWorks, Inc.
close all


Fs = 1500;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2000;             % Length of signal
t = (0:L-1)*T;        % Time vector
%% 
% Form a signal containing a 50 Hz sinusoid of amplitude 0.7 and a 120 Hz 
% sinusoid of amplitude 1.

S = ((0.7*sin(2*pi*500*t))>=0)-1*((0.7*sin(2*pi*500*t))<0)

%% 
% Corrupt the signal with zero-mean white noise with a variance of 4.

X = S ;
%% 
% Plot the noisy signal in the time domain. It is difficult to identify 
% the frequency components by looking at the signal |X(t)|. 

stem(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')
%% 
% Compute the Fourier transform of the signal. 


%%
% Compute the two-sided spectrum |P2|.  Then compute the single-sided
% spectrum |P1| based on |P2| and the even-valued signal length |L|.

%% 
% Define the frequency domain |f| and plot the single-sided amplitude
% spectrum |P1|.  The amplitudes are not exactly at 0.7 and 1, as expected, because of the added 
% noise. On average, longer signals produce better frequency approximations.


%% 
% Now, take the Fourier transform of the original, uncorrupted signal and 
% retrieve the exact amplitudes, 0.7 and 1.0.

Y = fft(S,1024);
f=(Fs/2)*linspace(-1,1,1024);
Y1=fftshift(Y);
figure

plot(f,abs(Y1)) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')