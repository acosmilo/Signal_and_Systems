function [ ] = ejercicio7(  )

clear all
close all
n=-3:1:1;
x=escalon(n+3)-escalon(n-2);
stem(n,x)

n2=-1:1:3;
h=escalon(n2+1)-escalon(n2-4);
figure;
stem(n2,h);
y=conv(x,h);
figure
%n=N1+N2-1
n3=-3-1:1:length(x)+length(h)-2-3-1;
stem(n3,y);
grid

end