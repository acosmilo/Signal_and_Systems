function [ ] = tercero()
%Probar la propiedad de linealidad usando un ejemplo en matlab

close all
clear all
%Para probar la propiedad de linealidad se efectuara la T.F de a*x1+b*x2 
%almacenada en un vector Y1 y las transformadas de fourier de a*x1 y de
%a*x2 para luego sumarlas.
%Si la propiedad es verdad la grafica de fase y modulo de F{a*x1+b*x2} debe
%ser igual a las graficas de F{a*x1}+ F{b*x2}
n=0:12;

%%%%%%%%%% figura 1
figure
%grafica  x1[n]
subplot(3,1,1)
x1=(escalon(n)-escalon(n-10));;
stem(n,x1);
title('Senal x1[n]=(u[n]-u[n-10])')
grid 
%grafica x2[n]
subplot(3,1,2)
x2=(escalon(n-1)-escalon(n-4));
stem(n,x2);
title('Senal x2[n]=(u[n-1]-u[n-4])')
grid 
%grafica de y[n] =ax[n]+bx2[n]
subplot(3,1,3)
a=3;
b=2;
y=a*x1+b*x2;
stem(y);
title('Senal y[n]=ax1[n]+bx2[n], a=3 b=2')
grid

%%%%%%%%%%%%figura 2
figure

%ftt de y, de -pi a pi
 NFFT = 256;
 Y=fft(y,NFFT);
 Y1=fftshift(Y);
 w=pi*linspace(-1,1,NFFT);
 
 %grafica  modulo Y1
 subplot(2,1,1)
 plot(w,abs(Y1),'g')
 title('Modulo T.F de -pi a pi, usando Y(w) ')
 xlabel('Frecuency (rad)')
 grid
 
 %grafica fase Y1
 subplot(2,1,2)
 plot(w,angle(Y1),'r')
 title('Fase T.F de -pi a pi, usando Y(w) ')
 xlabel('Frecuency (rad)')
 grid
 
 %%%%%%%figura 3
 figure
 %Vector X1 guarda los valores de la T.F de ax1[n]
 NFFT2 = 512;
 X=fft(a*x1,NFFT2);
 X1=fftshift(X);
 %Vector X2 guarda los valores de la T.F de bx2[n]
 H=fft(b*x2,NFFT2);
 X2=fftshift(H);
 
 %Ys= guarda los valores de aX(w)+bX2(w)
 Ys=X1+X2;
 %m vector para la frecuencia, de -pi a pi
 m=pi*linspace(-1,1,NFFT2);

  
 %grafica  modulo Ys o aX1(w)+bX2(w)
 subplot(2,1,1)
 plot(m,abs(Ys),'g')
 title('Modulo T.F de -pi a pi, usando aX(w)+bH(w)')
 xlabel('Frecuency (rad)')
 grid
 
 %grafica fase Ys o aX1(w)+bX2(w)
 subplot(2,1,2)
 plot(m,angle(Ys),'r')
 title('Fase T.F de -pi a pi, usando aX(w)+bH(w)')
 xlabel('Frecuency (rad)')
 grid
 
end

