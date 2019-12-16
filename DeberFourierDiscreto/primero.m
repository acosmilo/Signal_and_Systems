function [  ] = primero(  )
%Ejercicio 1
%Calcule la transformada de Fourier de de la senal x[n]=(4/5)^n con
%0<=n<=20 ydibuje el modulo y la fase de x(w) sobre los intervalos de
%frecuencia -pi<=w<=pi  y -5pi<=w<=5pi.

%Se borra variables y se cierran las ventanas
clear all 
close all
    
%Se crea un vector n para 0<=n<=20
 n=0:20;
%Se crea la funcion x[n]
 x =(4/5).^n;
%Se crea la primera figura con 
 figure
%Se crea un mosaico para seis graficas
 subplot(3,2,1)
 %steam grafica la senal discreta x[n]
 stem(n,x)
 title('Signal x =(4/5).^n')
 xlabel('n')
 grid
 % usando fft, sacamos la transformada rapida de fourier de x[n] y se le
 % asigna en un vector Y1
 NFFT = 256;
 Y=fft(x,NFFT);
 Y1=fftshift(Y);
 %w es un vector  que va desde -pi hasta pi 
 w=pi*linspace(-1,1,NFFT);

 subplot(3,2,3)
 %Se plotea el modulo Y1 en funcion del vector w
 plot(w,abs(Y1),'g')
 title('Modulo Transformada de Fourier de -pi a pi')
 xlabel('Frecuency (rad)')
 grid
 
 subplot(3,2,4)
 %Se plotea la fase Y1 en funcion del vector w
 plot(w,angle(Y1),'r')
 title('fase Transformada de Fourier de -pi a pi')
 xlabel('Frecuency (rad)')
 grid
 

 %para graficar y(w) de -5pi a 5pi, al ser una funcion periodica el vector y2
 %estara conformado varias veces por el vector Y1. Y el vector frecuencial
 %m usara el comando linspace(-1,1,5NFTT) y por 5pi. se usa 5 veces NFTT
 %porque m es 5 veces mas grande que w

 m=5*pi*linspace(-1,1,5*NFFT);
 Y2=[Y1 Y1 Y1 Y1 Y1];

 
 subplot(3,2,5)
 %Se plotea el modulo Y2 en funcion del vector m
 plot(m,abs(Y2),'g')
 title('Modulo Transformada de Fourier de -5pi a 5pi')
 xlabel('Frecuency (rad)')
 grid
 
 %Se plotea el modulo Y2 en funcion del vector m
 subplot(3,2,6)
 plot(m,angle(Y2),'r')
 title('fase Transformada de Fourier de -5pi a 5pi')
 xlabel('Frecuency (rad)')
 grid
end