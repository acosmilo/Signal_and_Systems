function [  ] = ejemplo2(  )
%UNTITLED3 Smmary of this function goes her
close all

n1=0:1:9;
h=function1(n1);
stem(n1,h);
grid 

n2=0:1:10;
x=function3(n2);
figure
stem(n2,x);
grid 

y=conv(x,h);
%El numero de muestras N=N1+N2-1
figure
stem(y);
%n3=0:1:19;
%stem(n3,y)
grid




end

