function [ ] = ejercicio1a( )

%Se limpia todas las variables del Workspace
clear all
%Se cierran todas las figuras
close all
%Para crear la primera senal discreta se crea un vector t que la delimite
t=0:0.01:10;
%Dada la funcion Escalon definida por:
%......................................
%function [ h ] = escalon( n )
%h = n>=0;
%end
%......................................

%Usando la funcion escalon se crea una funcion cuadrada continua x1(t), que va
%desde 0 a 10:

x1=heaviside(t)-heaviside(t-2);

%Usando plot() se grafica de manera discreta x1(n), de color rojo
plot(t,x1,'r');
grid
xlabel('t')
ylabel('h(t)')
title('Senal h(t)')

%Para crear la segunda senal continua se crea un vector t2 que la delimite
t2=0:0.01:10;

%Se crea la funcion x2
x2=heaviside(t2)-heaviside(t2-4);

%Usando plot() se grafica de manera continua x2(t), de color verde
figure;
plot(t2,x2,'b');
grid
xlabel('t')
ylabel('x(t)')
title('Senal x(t)')

%Se obtiene la convolucion usando conv()
Y=conv(x1,x2)*0.01;
figure
%t3=t+t2

t3=0:0.01:(length(x2)+length(x1)-2)*0.01;
plot(t3,Y);
grid
xlabel('t')
ylabel('y[t]')
title('Senal y[t]')


%Se limpia las variables

%Se saca la transformada de Fourier de x1(t) y x2(t)
syms w 
z=rampas(w)-rampas(w-2)-rampas(w-4)+rampas(w-6)

Z = fourier(z,w)

figure
subplot(1,2,1)
fplot(z,[-1 7])



subplot(1,2,2)
fplot(abs(Z),[-20 20])

end

