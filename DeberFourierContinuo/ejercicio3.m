function [ ] = ejercicio3(  )
%Calcule la salida de un sistema LTI con: 


syms  t w;
h = exp(-t)*heaviside(t)
H = fourier(h,w)

x = exp(-t)*cos(2*pi*t)*heaviside(t)
X = fourier(x,w)

Y = H*X
 
y = ifourier(Y,'t')

fplot(y,[-10,10])



end

