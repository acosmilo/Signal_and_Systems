function [ ] = ejercicio2(  )
%Universidad de las Fuerzas Armadas
%Autor: Camilo Acosta
%Senales y Sistemas
%Deber Prueba de Convolucion en Matlab

%Dada la respuesta al impulso de un sistema LTI, h(t)=u(t-1)-u(t-4). Encuentra la
%salida del sistema en respuesta a la entrada x(t)=u(t)+u(t+1)-2u(t-2).

%Se limpia todas las variables del Workspace
clear all
%Se cierran todas las figuras
close all
%Para crear la primera senal discreta se crea un vector n que la delimite
t=0:0.01:10;
%Dada la funcion Escalon definida por:
%......................................
%function [ h ] = escalon( n )
%h = n>=0;
%end
%......................................

%Usando la funcion escalon se crea una funcion "cuadrada" discreta, que va
%desde -10 a 10:

h=(escalon(t-1)-escalon(t-4));

%Usando stem() se grafica de manera discreta x[n], de color rojo
plot(t,h,'r');
grid
xlabel('t')
ylabel('h(t)')
title('Senal h(t)')

%Para crear la primera senal discreta se crea un vector n2 que la delimite
t2=-2:0.01:10;


x=escalon(t2+1)+escalon(t2)-2*escalon(t2-2);

%x=x1+x2;

%Usando stem() se grafica de manera discreta h[n], de color verde
figure;
plot(t2,x,'b');
grid
xlabel('t')
ylabel('x(t)')
title('Senal x(t)')

%Se obtiene la convolucion usando conv()
y=conv(h,x)*0.01;
figure
%t3=t+t2
%para saber la longitud de n3 se restan a ambos limites los limites
%inferiores de n=-10 y n2=-4
t3=0:0.01:(length(x)+length(h)-2)*0.01;
%Usando stem() se grafica de manera discreta y[n], usando n3
plot(t3,y);
grid
xlabel('t')
ylabel('y[t]')
title('Senal y[t]')

end