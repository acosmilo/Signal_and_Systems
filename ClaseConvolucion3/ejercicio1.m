function [ ] = ejercicio1(  )
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
stem(y);
grid

end

