function [ ] = ejercicioc1(  )
clear all
close all
t=0:0.01:4;
x=escalon(t)-escalon(t-4);
plot(t,x)
h=escalon(t)-escalon(t-4);
figure;
plot(t,h);
y=conv(x,h)*0.01;
t3=0:0.01:0.01*(length(x)+length(h)-2)
figure
plot(t3,y);
grid

end
