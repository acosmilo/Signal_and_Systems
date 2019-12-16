function [  ] = ejercicio1(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB

syms a t s;
f=exp(-a*t)*heaviside(t);
F=laplace(f)
pretty(F)

fplot(f,[-1 10])
%MATLAB no me da la ROC

end

