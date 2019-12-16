function [  ] = ejemplo1(  )
%UNTITLED3 Smmary of this function goes her
close all

n=-10:1:25;
h=function1(n);
stem(n,h);
grid 

x=function2(n);
figure
stem(n,x);
grid 

y=conv(x,h);
%El numero de muestras N=N1+N2-1
figure
stem(y);
grid




end

