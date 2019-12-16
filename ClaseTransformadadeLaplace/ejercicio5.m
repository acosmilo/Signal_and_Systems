function [  ] = ejercicio5(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB
%Transformada de Laplace e^(-a*|t|)
%Descomponemos la funcion en e^(-a*t) y e^(a*t)
syms a s t;
f=exp(a*t)*heaviside(-t)+exp(-a*t)*heaviside(t);
F=laplace(f)
pretty(F)

%MATLAB no me da la ROC

end

