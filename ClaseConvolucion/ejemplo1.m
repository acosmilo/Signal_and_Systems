function [  ] = ejemplo1(  )
%UNTITLED3 Smmary of this function goes her
close all

n=-10:0.01:30;
h=function1(n);
plot(n,h);
grid 
ylim([-0.5 1.3]);
h1=function1(n-10);
figure
plot(n,h1);
grid
h2=function1(2*n);
figure
plot(n,h2);
grid
h3=function1(2*n-4);
figure
plot(n,h3);
grid





end

