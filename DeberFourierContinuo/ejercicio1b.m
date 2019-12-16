function [  ] = ejercicio1b(  )

clear all

syms  t w;
x1 = heaviside(t)-heaviside(t-2);
X1 = fourier(x1,w)


x2 = heaviside(t)-heaviside(t-4);
X2 = fourier(x2,w)

Y = X1*X2


figure
subplot(3,2,1)
fplot(x1,[-20 20])
subplot(3,2,2)
fplot(abs(X1),[-20 20])

subplot(3,2,3)
fplot(x2,[-20 20])
subplot(3,2,4)
fplot(abs(X2),[-20 20])


subplot(3,2,[5,6])
fplot(abs(Y),[-20 20])






end

