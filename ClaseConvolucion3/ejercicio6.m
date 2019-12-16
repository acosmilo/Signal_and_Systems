function [ ] = ejercicio6(  )

clear all
close all
n=-3:1:1;
x=escalon(n+3)-escalon(n-2);
stem(n,x)

n2=0:1:4;
h=escalon(n2)-escalon(n2-5);
figure;
stem(n2,h);
y=conv(x,h);
figure
%n=N1+N2-1
n3=-3:1:length(x)+length(h)-2-3;
stem(n3,y);
grid

end