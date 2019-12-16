function [  ] = ejemplo3( )
%UNTITLED5 Summary of this function goes here
% x(t) = sin(pt)/(pt) = sinc(t)
close all
syms t w
x = sin(pi*t)/(pi*t);
fplot(x,[-10 10])
X = fourier(x,w);
legend('x(t)');
figure
fplot(X,[-10 10])
legend('X(\omega)');
xlabel('\omega');

end

