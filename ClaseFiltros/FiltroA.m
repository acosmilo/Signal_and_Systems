clear all
clc 

%filtro analogico butterworth 
%fp=80Hz
%fs=100 Hz

Wp=410*2*pi;
Ws=500*2*pi;
Rp=3;
Rs=60;


[N,Wn]=ellipord(Wp,Ws,Rp,Rs,'s');

[b,a]=ellip(N,Wn,'s');
[H,w]=freqs(b,a);

figure;
plot(w/(2*pi),mag2db(abs(H)))
sys=tf(b,a)

 
Fs=1000;
T=1/Fs;
L=1000;
t=(0:L-1)*T;

x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t);
y=x;
figure; 
plot (Fs*t(1:50),y(1:50))
title('senal de entrada')
xlabel('tiempo(ms)')


lsim(sys,y,t);
salida=lsim(sys,y,t);

figure;
plot(Fs*t(1:150),salida(1:150))
title('sinal filtrada')
xlabel('time(ms)')


NFFT=2^nextpow2(L);
Ys=fft(salida,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
figure;
plot(f,2*abs(Ys(1:NFFT/2+1)));
title('Espectro de la senal filtrada')
xlabel('Frecuencia(Hz)')
ylabel('|Y(f)|')