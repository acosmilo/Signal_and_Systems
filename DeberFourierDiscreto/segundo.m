function [  ] = segundo( )
%Ejercicio 2 
%Dada la senal x[n]=(3/5)^n u[n] calcule la transformada de Fourier de
%esta senal usando la ecuacion de Fourier

close all
clear all 
%Se comparara las grafica de modulo y fase de la transformada de Fourier
%usando el comando symsum (la sumatoria) y con el comando fft 
%(la T rapida de Fourier)
%%%%%%%%%%%%%%%%%%Con sumatoria
%Se crea un vector de 0 a 10
n=0:10;
%Se crea la senal x[n]
x=((3/5).^n).*escalon(n);

subplot(3,2,1)
%se grafica x[n]
stem(n,x)
title('senal x[n]=(3/5)^n u[n]')
grid
%usando el comando symsum se saca la transformada de Fourier de x[n] desde
%cero hasta infinito, para ello se crean las varianbles simbolicas k 
%(que es n en la sumatoria) y w como la frecuencia normalizada
syms k w
%tsum en funcion de la variable simbolica w es la transformada de Fourier
%usando symsum desde 0 al infinito.
tsum(w)=symsum(((3/5)*exp(-i*w))^k,k,0,inf);
%m es un vector y variable numerica que va desde -pi a pi y permitira
%evaluar tsum(m)
m=-pi:0.01:pi;

subplot(3,2,3)
%grafica modulo de tsum
plot(m,abs(tsum(m)),'g')
title('Modulo T.F de -pi a pi, con comando symsum()')
xlabel('Frecuency (rad)')
grid

subplot(3,2,4)
%grafica fase de tsum
plot(m,angle(tsum(m)),'r')
title('Fase T.F de -pi a pi, con comando symsum()')
xlabel('Frecuency (rad)')
grid
%%%%%%%%%%%%%con fft


%Y1 es la T de Fourier en un vector
 NFFT = 256;
 Y=fft(x,NFFT);
 Y1=fftshift(Y);
 %p es el vector donde se podra plotear Y1, desde -pi a pi
 p=pi*linspace(-1,1,NFFT);

 %Al graficar ambos modulos y fases deben salir los mismos
 subplot(3,2,5)
 plot(p,abs(Y1),'g')
 title('Modulo T.F de -pi a pi, con comando fft()')
 xlabel('Frecuency (rad)')
 grid
 
 subplot(3,2,6)
 plot(p,angle(Y1),'r')
 title('Fase T.F de -pi a pi, con comando fft()')
 xlabel('Frecuency (rad)')
 grid
 
end
