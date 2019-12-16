function [  ] = ejercicioinverso1(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB

syms  s ;
F=(5*s+13)/(s*(s^2+4*s+13))
f=ilaplace(F)
pretty(f)


pretty(laplace(f))

%Ejemlo 3
F=(s^2+2*s+5)/((s+3)*(s+5)^2)
f=ilaplace(F)
pretty(f)


pretty(laplace(f))

end

