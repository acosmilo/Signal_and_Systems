function [ ] = ejercicio4(  )
clear all
close all
n=0:1:7;
x=escalon(n-3)-escalon(n-8);
stem(n,x)
h=escalon(n-1)-escalon(n-6);
figure;
stem(n,h);
y=conv(x,h);
figure
%n=N1+N2-1
n3=0:1:length(x)+length(h)-2;
stem(n3,y);
grid

end