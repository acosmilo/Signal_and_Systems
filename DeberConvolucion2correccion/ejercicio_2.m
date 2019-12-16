function [ ] = ejercicio_2(  )
%Universidad de las Fuerzas Armadas
%Autor: Camilo Acosta
%Senales y Sistemas
%Deber 2 Convolucion en Matlab

%Dada la respuesta al impulso de un sistema LTI, h(t)=u(t-1)-u(t-4). 
%Encuentra la salida del sistema en respuesta a la entrada
%x(t)=u(t)+u(t+1)-2u(t-2).

%Se limpia todas las variables del Workspace
clear all
%Se cierran todas las figuras
close all
%Para crear la primera senal discreta se crea un vector t que la delimite
%Se usa intervalos de 0.01 para que parezca una senal continua.
t=0:0.01:10;
%Dada la funcion Escalon definida por:
%......................................
%function [ h ] = escalon( n )
%h = n>=0;
%end
%......................................

%Usando la funcion escalon se crea una funcion "cuadrada" discreta, que va
%usando el vector t

h=(escalon(t-1)-escalon(t-4));

%Usando plot() se grafica de manera 'continua' h(t), de color rojo
plot(t,h,'r');
grid
xlabel('t')
ylabel('h(t)')
title('Senal h(t)')

%Para crear la primera senal discreta se crea un vector t2 que la delimite
%Se usa intervalos de 0.01 para que parezca una senal continua.
t2=-2:0.01:10;

x=escalon(t2+1)+escalon(t2)-2*escalon(t2-2);


%Usando plot() se grafica de manera 'continua' x(t), de color azul
figure;
plot(t2,x,'b');
grid
xlabel('t')
ylabel('x(t)')
title('Senal x(t)')

%Se obtiene la convolucion usando conv()
y=conv(x,h)*0.01;
figure
%El vector t3 delimita al eje temporal
%t3 va en intervalos de 0.01, por lo que a su limite superior 
%(length(x)+length(h)-2) se lo multiplica por 0.01  
%para saber el limite inferior  y superior del vector t3,  se suma el 
%limite inferior del vector t2, que es -2, a ambos limites del vector t3

t3=-2:0.01:((length(x)+length(h)-2)*0.01)-2;
%Usando plot() se grafica de manera 'continua' y(t), usando t3, con el
%color cyan.
plot(t3,y,'cyan');
grid
xlabel('t')
ylabel('y(t)')
title('Senal y(t)')

end