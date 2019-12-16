function [ ] = ejercicio5(  )
%sale mal por el eje temporal
clear all
close all
n=-3:1:4;
x=escalon(n+3)-escalon(n-2);
stem(n,x)
h=escalon(n)-escalon(n-5);
figure;
stem(n,h);
y=conv(x,h);
figure
%n=N1+N2-1
n3=-3:1:length(x)+length(h)-2-3;
stem(n3,y);
grid

end