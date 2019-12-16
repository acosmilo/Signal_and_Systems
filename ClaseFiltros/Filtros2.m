clear all
clc 

%filtro analogico butterworth 
%fp=80Hz
%fs=100 Hz

Wp=80*2*pi;%frecuencia de paso
Ws=100*2*pi;%frecuencia de rechazo 
Rp=3;%en dB
Rs=60;%en dB

[N,Wn]=buttord(Wp,Ws,Rp,Rs,'s');
%N orden 
%Wn=Wn/(2*pi); %para ver la frecuncia de corte
[b,a]=butter(N,Wn,'s');
[H,w]=freqs(b,a);
plot(w/(2*pi),mag2db(abs(H)))
sys=tf(b,a)