function [  ] = ejercicioinverso1(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Solo saca TL para S.Causal
%   Sistemas en Tiempo Real

%Matematica Simbolica, no puedo usar mis funciones, solo las funciones de
%MATLAB

syms  s t;
F=1/((s+1)*(s+2))
f=ilaplace(F)
pretty(f)




end

