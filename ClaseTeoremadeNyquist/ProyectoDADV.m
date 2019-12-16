close all
clear all

Fs = 16000; 
nBits = 24; 
nChannels = 1; 
disp('grabando');
recObj = audiorecorder (Fs, nBits, nChannels);
recordblocking (recObj, 5);
disp('fin de lagrabacion');

audio=getaudiodata(recObj);
audiowrite ('audio.wav', audio , Fs);

%%%%%%%%%%%%%%primero a 16kHz
t=(0:length(audio)-1)/Fs;

%NFFT=512;%numero de puntos de fft
Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
% Y(2:end-1)=2*Y(2:end-1);
%Y1=fftshift(Y);
f=Fs*(0:length(audio)/2)/length(audio);


figure 
subplot(1,2,1)
plot (t,audio);
xlim([0 5])
ylim([-0.5 0.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 16k[Hz]')

subplot(1,2,2)
plot (f,Y)
xlim([0 8000])
ylim([0 0.0045])
xlabel('Frecuencia 16k[Hz]');
ylabel('|Y(f)|')

%aqui ya me crea la senal a otra frecuencia 

audiowrite ('audio1.wav', audio, (Fs/2));

t1=(0:length(audio)-1)/(Fs/2);
figure
subplot(1,2,1)
plot(t1,audio)
xlim([0 10])
ylim([-0.5 0.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 8k[Hz]')


f1=(Fs/2)*(0:length(audio)/2)/length(audio);
subplot(1,2,2)
plot (f1,Y)
xlim([0 8000])
ylim([0 0.0045])
xlabel('Frecuencia 8k[Hz]');
ylabel('|Y(f)|')


audiowrite ('audio2.wav', audio, (Fs/4));

t2=(0:length(audio)-1)/(Fs/4);
figure
subplot(1,2,1)
plot(t2,audio)
xlim([0 80])
ylim([-0.5 0.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 4k[Hz]')

f2=(Fs/4)*(0:length(audio)/2)/length(audio);
subplot(1,2,2)
plot (f2,Y)
xlim([0 8000])
ylim([0 0.0045])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')

audiowrite ('audio3.wav', audio, (Fs/8));

t3=(0:length(audio)-1)/(Fs/8);
figure
subplot(1,2,1)
plot(t3,audio)
xlim([0 80])
ylim([-0.5 0.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 2k[Hz]')

f3=(Fs/8)*(0:length(audio)/2)/length(audio);
subplot(1,2,2)
plot (f3,Y)
xlim([0 8000])
ylim([0 0.0045])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')


audiowrite ('audio4.wav', audio, (Fs/16));

t4=(0:length(audio)-1)/(Fs/16);
figure
subplot(1,2,1)
plot(t4,audio)
xlim([0 80])
ylim([-0.5 0.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 2k[Hz]')


f4=(Fs/16)*(0:length(audio)/2)/length(audio);
subplot(1,2,2)
plot (f4,Y)
xlim([0 8000])
ylim([0 0.0045])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')