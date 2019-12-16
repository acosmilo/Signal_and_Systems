function [  ] = cuarto(  )
%Probar la propiedad de convolucion usando un ejemplo en matlab
close all
clear all
%Para probar la propiedad de convolucion se efectuara la convolucion entre
%x[n] cualquiera y h[n] cualquiera dando un y[n], si la propiedad es verdad
%X(w)H(w)=Y(w), es decir la grafica de fase y modulo de X(w)H(w) es igual a
% la de Y(w)
n=-10:25;

%%%%%%%%%% figura 1
figure
%grafica  x[n]
subplot(3,1,1)
x=escalon(n)-escalon(n-10);;
stem(n,x);
title('Senal x[n]=u[n]-u[n-10]')
grid 
%grafica h[n]
subplot(3,1,2)
h=n.*(escalon(n+5)-escalon(n-4));
stem(n,h);
title('Senal h[n]=n(u[n+5]-u[n-4])')
grid 
%grafica de y[n] aplicando conv()
subplot(3,1,3)
y=conv(x,h);
stem(y);
title('Senal y[n]')
grid

%%%%%%%%%%%%figura 2
figure

%ftt de y, de -pi a pi
 NFFT = 256;
 Y=fft(y,NFFT);
 Y1=fftshift(Y);
 w=pi*linspace(-1,1,NFFT);
 
 %grafica  modulo Y(W)
 subplot(2,1,1)
 plot(w,abs(Y1),'g')
 title('Modulo T.F de -pi a pi, usando Y(w)')
 xlabel('Frecuency (rad)')
 grid
 
 %grafica fase Y(W)
 subplot(2,1,2)
 plot(w,angle(Y1),'r')
 title('Fase T.F de -pi a pi, usando Y(w)')
 xlabel('Frecuency (rad)')
 grid
 
 %%%%%5%%figura 3
 figure
 %Vector X1 guarda los valores de la T.F de x[n]
 NFFT2 = 256;
 X=fft(x,NFFT2);
 X1=fftshift(X);
 %Vector H1 guarda los valores de la T.F de h[n]
 H=fft(h,NFFT2);
 H1=fftshift(H);
 
 %Ys= guarda los valores de Y(w)=X(w)H(w)
 Ys=X1.*H1;
 %m vector para la frecuencia, de -pi a pi
 m=pi*linspace(-1,1,NFFT2);

  
 %grafica  modulo Y(W)
 subplot(2,1,1)
 plot(m,abs(Ys),'g')
 title('Modulo T.F de -pi a pi, usando H(w)X(w)')
 xlabel('Frecuency (rad)')
 grid
 
 %grafica fase Y(W)
 subplot(2,1,2)
 plot(m,angle(Ys),'r')
 title('Fase T.F de -pi a pi, usando H(w)X(w)')
 xlabel('Frecuency (rad)')
 grid
 
end
