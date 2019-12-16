function [ ] = ejercicio1( )

%Demuestre la Propiedad de la Transformada de Fourier de la convolucion de
%dos senales:
%            F
%x1(t)*x2(t)-->X1(w)X2(w)


%Se limpia todas las variables del Workspace
clear all
%Se cierran todas las figuras
close all
%Para crear las primeras senal continua se crea un vector t que la delimite
t=0:0.01:10;

%Usando la funcion heaviside se crea una funcion cuadrada continua x1(t) y
%x2(t)

x1=heaviside(t)-heaviside(t-2);
x2=heaviside(t)-heaviside(t-4);
%Usando plot() se grafica de manera discreta x1(n), de color rojo

%Se obtiene la convolucion usando conv(), el vector t2 tiene una longitud
%igual a length(x2)+length(x1)-2)*0.01 para ubicar correctamente el eje
%vertical de la convolucion
Y=conv(x1,x2)*0.01;
t2=0:0.01:(length(x2)+length(x1)-2)*0.01;

%Se grafica x1(t) , x2(t) y y(t) usando plot ya que t es una variable
%double
figure
subplot(3,2,1)
plot(t,x1,'m');
grid
xlabel('t')
ylabel('x_1(t)')
title('Senal x_1(t)')
ylim([-0.4 , 1.4])




subplot(3,2,2)
plot(t,x2,'b');
grid
xlabel('t')
ylabel('x_2(t)')
title('Senal x_2(t)')
ylim([-0.4 , 1.4])



subplot(3,2,3)

plot(t2,Y,'k');
grid
xlabel('t')
ylabel('y(t)')
title('Convolucion x_1(t) \ast x_2(t)')
ylim([-0.4 , 2.4])

%Para obtener la Transformada de Fourier de la convolucion de x1(t) con
%x2(t) es necesario tener la suncion como variable simbolica.
%Se crea la  variable simbolica w y la funcion z  que es la version
%simbolica de la funcion y(t) para asi poder usar fourier()
syms p 
z=rampas(p)-rampas(p-2)-rampas(p-4)+rampas(p-6)

Z = fourier(z,p)

%Se grafica y(t) (con variable simbolica) y Y(w) con fplot()
subplot(3,2,4)
fplot(z,[-1 7],'k')
grid
xlabel('t')
ylabel('y(t)')
title('Grafica y(t) (con Variable Simbolica)')
ylim([-0.4 , 2.4])

%La Transformada de Fourier de la convolucion enrtre x1(t) y x2(t) se
%grafica de color verde
subplot(3,2,[5,6])
fplot(abs(Z),[-10 10],'g')
grid
xlabel('\omega')
ylabel('Y(\omega)')
title('T.F de y(t)')
ylim([-0.4 , 8.8])

%Se limpia todas las variables
clear all

%Se crea dos variables simbolicas t por tiempo y w por frecuencia
syms  t w;

%Se escriben la funcion x1 con variables simbolicas y se saca la
%Transformada de Fourier.
x1 = heaviside(t)-heaviside(t-2);
X1 = fourier(x1,w)

%Se escriben la funcion x2 con variables simbolicas y se saca la
%Transformada de Fourier.
x2 = heaviside(t)-heaviside(t-4);
X2 = fourier(x2,w)

%Se multiplica las dos senales
Y = X1*X2

%Se grafica x1(t), X1(w), x2(t), X2(w)
figure

subplot(3,2,1)
fplot(x1,[0 10],'m')
grid
xlabel('t')
ylabel('x_1(t)')
title('Senal x_1(t)')
ylim([-0.4 , 1.4])

subplot(3,2,2)
fplot(abs(X1),[-20 20],'r')
grid
xlabel('\omega')
ylabel('X_1(\omega)')
title('T.F de x_1(t)')
ylim([-0.4 , 2.4])

subplot(3,2,3)
fplot(x2,[0 10],'b')
grid
xlabel('t')
ylabel('x_2(t)')
title('Senal x_2(t)')
ylim([-0.4 , 1.4])

subplot(3,2,4)
fplot(abs(X2),[-20 20],'c')
grid
xlabel('\omega')
ylabel('X_2(\omega)')
title('T.F de x_2(t)')
ylim([-0.4 , 4.8])

%Se grafica de color verde la multiplicacion de la T.F de x1(t) con la T.F
%de x2(t), Y(w)
subplot(3,2,[5,6])
fplot(abs(Y),[-10 10],'g')
grid
xlabel('\omega')
ylabel('Y(\omega)')
title('Multiplicacion X_1(\omega) \cdot X_2(\omega)')
ylim([-0.4 , 8.8])
end

