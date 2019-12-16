function [ ] = ejercicio1(  )
%Universidad de las Fuerzas Armadas
%Autor: Camilo Acosta
%Senales y Sistemas
%Deber 2 Convolucion en Matlab

%El sistema que se muestra en la siguiente figura esta formado con la 
%conexion de dos sistemas en cascada. Las respuestas al impulso de los 
%sistemas son:


%h1[n]=(1/6)^(n-6)*u[n]%
%h2[n]=(1/3)^(n)*u[n-3]%


%Se procede a hallar h3[n] por medio de la conexion en serie del sistema
%LTI1 con el LTI2, al ser en serie el h3[n] es el resultado de la
%convolucion de h1[n] con h2[n]. 

%se limpia todas las variables del Workspace
clear all
%Se cierran todas las figuras
close all
%Para crear la primera senal discreta se crea un vector n que la delimite
n=0:1:10;
%Dada la funcion Escalon definida por:
%......................................
%function [ h ] = escalon( n )
%h = n>=0;
%end
%......................................

%Usando la funcion escalon se crea una funcion h1[n]:

h1=((1/6).^(n-6)).*(escalon(n));

%Usando stem() se grafica de manera discreta h1[n], de color rojo
stem(n,h1,'r');
grid
xlabel('n')
ylabel('h1[n]')
title('Senal h1[n]')

%Para crear  senal discreta h2[n] se crea un vector n2 que la delimite
n2=0:1:10;


%Se crea la funcion cuadrada a partir del escalon que toma los valores.
%Se desplaza el escalon temporalmente tres muestras a la derecha.

h2=(escalon(n2-3)).*((1/3).^(n2));

%Usando stem() se grafica de manera discreta h2[n], de color verde
figure;
stem(n2,h2,'g');
grid
xlabel('n')
ylabel('h2[n]')
title('Senal h2[n]')

%Se obtiene la convolucion usando conv()
h3=conv(h1,h2);
figure
%n3=n+n2-1
%para saber la longitud de n3 solo basta con -2 al limite superior de n3
%para que matlab entienda. No es necesario sumar nada mas porque ambas
%senales x[n] y h[n] empiezan despues de cero 
n3=0:1:length(h1)+length(h2)-2;
%Usando stem() se grafica de manera discreta y[n], usando n3
stem(n3,h3);
grid
xlabel('n')
ylabel('h3[n]')
title('Senal h3[n]')

end