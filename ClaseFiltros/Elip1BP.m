

[A,B,C,D] = ellip(10,3,80,[390 410],'s');
d = designfilt('bandpassiir','FilterOrder',10, ...
    'PassbandFrequency1',390,'PassbandFrequency2',410, ...
    'PassbandRipple',3, ...
    'StopbandAttenuation1',80,'StopbandAttenuation2',40, ...
    'SampleRate',1000);


sos = ss2sos(A,B,C,D);
fvt = fvtool(sos,d,'Fs',1000);
legend(fvt,'ellip','designfilt')

Fs=1000;
T=1/Fs;%perdiodo de muestreo
L=1000;%muestras
t=(0:0.1:L-1)*T;%eje temporal 
%genero una senal senoidal 50Hz y de 120Hz
x=0.7*sin(2*pi*400*t);
y=x;%+2*randn(size(t));
figure; 
plot (Fs*t(1:1000),y(1:1000));
title('senal de entrada')
xlabel('tiempo(ms)')

salida = sosfilt(sos,y)

figure;
plot(Fs*t(1:1000),salida(1:1000))
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