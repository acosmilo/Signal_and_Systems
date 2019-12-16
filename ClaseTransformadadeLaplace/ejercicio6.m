function [  ] = ejercicio6(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB
%Transformada de Laplace derivada
syms  s t;
f=t*heaviside(t);
F=laplace(f)
pretty(F)

%MATLAB no me da la ROC

end

