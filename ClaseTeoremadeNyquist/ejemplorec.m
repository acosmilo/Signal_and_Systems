%% Cerrar Todo

close all
clear all

%% Creo un recObj 
Fs=16000
recObj = audiorecorder(Fs,16,1);
disp('Start speaking')
%Que dure 5 segundos
recordblocking(recObj, 5);
disp('End of Recording.');

%Reproduce el sonido
%play(recObj);

%Guardo el vector de muestras
myRecording = getaudiodata(recObj);

%Ploteo x[n]
figure
subplot(5,2,[1,2])
plot(myRecording);
title('x[n]')

%% Transformada de Fourier de x[n]


X = myRecording;

Y = fft(X,4096);
Y1=fftshift(Y);
f=pi*linspace(-1,1,4096);

subplot(5,2,[3,4])
plot(f,abs(Y1)) 
title('Transformada de Fourier')
xlabel('\omega')
ylabel('X(\omega)')

%% Transformada Inversa de Fourier Fs0=16k

X0 = ifft(Y,1024);
Fs0=8000;
f=(Fs0)*linspace(0,1,1024);

subplot(5,2,[5,6])
plot(f,X0) 
title('Transformada Inversa de Fourier')
xlabel('n')
ylabel('x[n]')


sound(abs(X0))