function [  ] = ejercicio7(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB

syms a s t;
f=t*exp(-a*t)*heaviside(t);
F=laplace(f)
pretty(F)

%MATLAB no me da la ROC

end

