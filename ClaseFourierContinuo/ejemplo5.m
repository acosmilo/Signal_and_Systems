function [  ] = ejemplo5(  )
close all
syms t w
x = exp(-t)*heaviside(t);
w0 = 3;
Left = fourier(x*cos(w0*t),w);
X = fourier(x,w);
Xw1 = subs(X,w,w+w0);

Xw2 = subs(X,w,w-w0);
Right = 0.5*(Xw1+Xw2);
Right = simplify(Right);

Left = fourier(x*sin(w0*t),w)
Right = (-1i/2)*(Xw1-Xw2);
Right = simplify(Right)

% 
% %% x(t) = e^|t|
% syms t
% x = exp(-1*abs(t));
% X = fourier(x,w)
% 
% %% x(t)= t e^|t|
% syms t
% x= t*exp(-1*abs(t));
% X = fourier(x,w)
% 
% %% x(t) = 4t/(1+t^2)^2
% x = 4*t/(1+t^2)^2;
% X = fourier(x,W))
% fplot(X, [-10 10])




end

