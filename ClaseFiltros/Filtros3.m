clear all
clc 

%filtro analogico butterworth 
%fp=80Hz
%fs=100 Hz

Wp=80*2*pi;%frecuencia de paso
Ws=100*2*pi;%frecuencia de rechazo 
Rp=3;%en dB
Rs=60;%en dB
%Rs=20;%en dB

[N,Wn]=buttord(Wp,Ws,Rp,Rs,'s');
%N orden 
%Wn=Wn/(2*pi); %para ver la frecuncia de corte
[b,a]=butter(N,Wn,'s');
[H,w]=freqs(b,a);
figure;
plot(w/(2*pi),mag2db(abs(H)))
sys=tf(b,a)

%generar las senales 
Fs=1000;
T=1/Fs;%perdiodo de muestreo
L=1000;%muestras
t=(0:L-1)*T;%eje temporal 
%genero una senal senoidal 50Hz y de 120Hz
x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t);
y=x;%+2*randn(size(t));
figure; 
plot (Fs*t(1:50),y(1:50))
title('senal de entrada')
xlabel('tiempo(ms)')

%probamos el filtro con la senal .lsim(aplica una senal a un sistema )
lsim(sys,y,t);%salida del sistema entender lo que hace gris entra azul sale 
salida=lsim(sys,y,t);

%obtener transformada de fourier para ver si le ejecutamos con 150 muestras
figure;
plot(Fs*t(1:150),salida(1:150))
title('sinal filtrada')
xlabel('time(ms)')

%demostramos que en realidad es una senal filtrada 
NFFT=2^nextpow2(L);%nextpower obtiene el multiplo de 2 mas pr0xima a 1000
Ys=fft(salida,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);%
%plot 
figure;
plot(f,2*abs(Ys(1:NFFT/2+1)));
title('Espectro de la senal filtrada')
xlabel('Frecuencia(Hz)')
ylabel('|Y(f)|')