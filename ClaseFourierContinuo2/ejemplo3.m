function [  ] = ejemplo3(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
syms t w
y = heaviside(t)-heaviside(t-4);
Y = fourier(y,w)
H = 1/(1i*w+3)
X=H/Y

x = ifourier(X,'t')

t0 = -20:0.1:20;
x = subs(x,t,t0)
plot(t0,x);




end

