clear all
close all
%% Diseno de filtros analogicos
n = 10;
f = 2000;
wn = 2*pi*f;
[zb,pb,kb] = butter(n,wn,'s'); % ceros y polos de la funcion de transferencia
[bb,ab] = zp2tf(zb,pb,kb); % numerador y denominador
sysb = tf(bb,ab) % Despliega H(s)
[hb,wb] = freqs(bb,ab,4096);

plot(wb/(2*pi),mag2db(abs(hb)))