close all
clear all
clc

Fs = 16000; 
nBits = 16; 
nChannels = 1; 
disp('grabando');
recObj = audiorecorder (Fs, nBits, nChannels);
recordblocking (recObj, 5);
disp('fin de lagrabacion');

audio=getaudiodata(recObj);
audiowrite ('audioOriginal.wav', audio , Fs);


%%%%%%%%%%%%%%primero a 16kHz

%NFFT=512;%numero de puntos de fft
f=Fs*(0:length(audio)/2)/length(audio);
Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
Y(2:end-1)=2*Y(2:end-1);
%Y1=fftshift(Y);
t=(0:length(audio)-1)/Fs;



figure 
subplot(1,2,1)
plot (t,audio,'Color',[0,0,1]);
xlim([0 5])
ylim([-2.5 2.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 16k[Hz]')

subplot(1,2,2)
plot (f,Y,'Color',[0,0.5,1])
xlim([0 8000])
ylim([0 0.005])
xlabel('Frecuencia 16k[Hz]');
ylabel('|Y(f)|')
title('Espectro de Frecuencia')


%%%%%%%%%%%%%%primero a 8kHz

audiowrite ('audio1.wav', audio, (Fs/2));

audio(2:2:end)=[];
t1=(0:length(audio)-1)/(Fs/2);

Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
 Y(2:end-1)=2*Y(2:end-1);
f1=(Fs/2)*(0:length(audio)/2)/length(audio);

figure
subplot(1,2,1)
plot(t1,audio,'Color',[0.5,0.5,1])
xlim([0 5])
ylim([-2.5 2.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 8k[Hz]')

subplot(1,2,2)
plot (f1,Y,'Color',[0.5,1,1])
xlim([0 4000])
ylim([0 0.005])
xlabel('Frecuencia 8k[Hz]');
ylabel('|Y(f)|')
title('Espectro de Frecuencia')

%%%%%%%%%%%%%%primero a 4kHz

audiowrite ('audio2.wav', audio, (Fs/4));

audio(2:2:end)=[];
t2=(0:length(audio)-1)/(Fs/4);
f2=(Fs/4)*(0:length(audio)/2)/length(audio);

Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
 Y(2:end-1)=2*Y(2:end-1);

figure
subplot(1,2,1)
plot(t2,audio,'Color',[1,0,1])
xlim([0 5])
ylim([-2.5 2.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 4k[Hz]')

subplot(1,2,2)
plot (f2,Y,'Color',[1 0.4 0.6])
xlim([0 2000])
ylim([0 0.005])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')
title('Espectro de Frecuencia')


%%%%%%%%%%%%%%primero a 2kHz

audiowrite ('audio3.wav', audio, (Fs/8));

audio(2:2:end)=[];
t3=(0:length(audio)-1)/(Fs/8);
f3=(Fs/8)*(0:length(audio)/2)/length(audio);

Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
Y(2:end-1)=2*Y(2:end-1);

figure
subplot(1,2,1)
plot(t3,audio,'Color',[0.3 1 0.7])
xlim([0 5])
ylim([-2.5 2.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 2k[Hz]')

subplot(1,2,2)
plot (f3,Y,'Color',[0.5 1 0])
xlim([0 1000])
ylim([0 0.005])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')
title('Espectro de Frecuencia')

%%%%%%%%%%%%%%primero a 1kHz

audiowrite ('audio4.wav', audio, (Fs/16));

audio(2:2:end)=[];
t4=(0:length(audio)-1)/(Fs/16);
f4=(Fs/16)*(0:length(audio)/2)/length(audio);

Y=abs(fft(audio)/length(audio));
Y=Y(1:length(audio)/2+1);
 Y(2:end-1)=2*Y(2:end-1);

figure
subplot(1,2,1)
plot(t4,audio,'Color',[1 0 0.5])
xlim([0 5])
ylim([-2.5 2.5])
xlabel('Tiempo[s]');
ylabel('Amplitud')
title('Senal a 2k[Hz]')

subplot(1,2,2)
plot (f4,Y,'Color',[1 0.5 0])
xlim([0 500])
ylim([0 0.005])
xlabel('Frecuencia[Hz]');
ylabel('|Y(f)|')
title('Espectro de Frecuencia')