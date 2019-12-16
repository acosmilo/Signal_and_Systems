function [  ] = ejercicio2(  )
%   x(t) = te^(-3t)

syms t w
%Senal x(t)
x = t*exp(-3*t)*heaviside(t);
X = fourier(x,w);
%Valores en los que va la senal X(w)
w = -20:0.1:20;
X = subs(X,w);
figure
plot(w,abs(X));
legend('magnitud')


end