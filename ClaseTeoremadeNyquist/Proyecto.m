%% Cerrar Todo

close all
clear all
clc

%% Creo un recObj 
Fs=16000
recObj = audiorecorder(Fs,16,1);
disp('Start speaking')
%Que dure 5 segundos
recordblocking(recObj, 5);
disp('End of Recording.');

%Reproduce el sonido
%play(recObj)

%Guardo el vector de muestras
myRecording = getaudiodata(recObj);

%Ploteo x[n]
figure
subplot(3,1,1)
plot(myRecording);
title('x[n]')

%% Transformada de Fourier de x[n]


myRecording;

Tx = fft(myRecording,80000);
Tx_shift=fftshift(Tx);
f=pi*linspace(-1,1,80000);

subplot(3,1,2)
plot(f,real(Tx_shift)) 
title('Transformada de Fourier')
xlabel('\omega')
ylabel('X(\omega)')

%% Transformada Inversa de Fourier Fs0=16k

iTx = ifft(Tx);


subplot(3,1,3)
plot(iTx) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')


figure

x0 = ifft(Tx,80000);


subplot(4,1,1)
plot(real(x0)) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')

x1 = ifft(Tx,40000);


subplot(4,1,2)
plot(real(x1)) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')

x2 = ifft(Tx,20000);


subplot(4,1,3)
plot(real(x2)) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')

x3 = ifft(Tx,10000);


subplot(4,1,4)
plot(real(x2)) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')

