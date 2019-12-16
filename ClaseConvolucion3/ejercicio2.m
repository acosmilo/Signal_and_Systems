function [ ] = ejercicio2(  )
clear all
close all
n=0:1:4;
x=escalon(n)-escalon(n-5);
stem(n,x)
h=escalon(n)-escalon(n-5);
figure;
stem(n,h);
y=conv(x,h);
figure
%n=N1+N2-1
n3=0:1:length(x)+length(h)-2;
stem(n3,y);
grid

end