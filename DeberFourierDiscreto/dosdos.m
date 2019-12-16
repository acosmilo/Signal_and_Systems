function [ output_args ] = dosdos( input_args )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


%Dada la se?al x[n]=(3/5)^n u[n] calcule la transformada de Fourier de esta se?al usando la ecuaci?n de Fourier:

clear all 
clc

n=-6:6;
x=((3/5).^n).*escalon(n);
subplot(3,1,1)
stem(n,x);
title('se?al');
%usando la sumatoria 
syms k w
tdf(w)=symsum(((3/5)*exp(-i*w))^k,k,0,inf);
pretty(tdf)
a=-pi:0.1:pi;
subplot(3,1,2)
plot(a,abs(tdf(a)))
title('Modulo');
subplot(3,1,3)
plot(a,angle(tdf(a)))
title('Fase');
 
%usando la Tdf
L=100;            
n1 = (0:L-1);       
x1 = ((3/5).^n).*escalon(n);
figure
subplot(2,1,1)
% stem(n1,x1)
title('senal')
NFFT=1000;%numero de puntos de fft
Y=fft(x1,NFFT);
Y1=fftshift(Y);
f=pi*linspace(-1,1,NFFT);%linespace divide un intervalo en os puntos que se le pide 
length(abs(x1))
length(n1)
subplot(2,1,2)
% plot (f,abs(Y1))


title('Transformada de fourier ')
end

