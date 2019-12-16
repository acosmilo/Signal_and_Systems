clear all
clc 

%filtros analogicos 
%disenar el filtro en butterworth
n=5;%establecer el valor de n, orden del filtro  
f=2000;
wn=2*pi*f;%frecuencia de corte 
[zb,pb,kb]=butter(n,wn,'s');%n orden del filtro, s para que sea analogico. kb es una constante, zb y pb Devuelve Ceros y polos de la funcion de transferencia.
%ver el filtro 
[bb,ab]=zp2tf(zb,pb,kb);% numerador y denominador, coeficientes H(s)%funcion de transferencia
 %prueba si el filtro funciona 
sysb=tf(bb,ab)%despliega H(s)
%freqs frecuencia y 4096 cuantos puntos en frecuecia 
[hb,wb]=freqs(bb,ab,4096); %devuelve frecuencia y amplitud 
% ploteo la esta en frecuencia y se grafica en db
plot(wb/(2*pi),mag2db(abs(hb)))%f=w/(2pi) y magnitud en db, tengo en radianes wb y le paso a frecuencia 

%disenar el filtro chebyche1
[z1,p1,k1]=cheby1(n,3,wn,'s');%3deltap rizado de banda pasante 
[b1,a1]=zp2tf(z1,p1,k1);
sys1=tf(b1,a1)
[h1,w1]=freqs(b1,a1,4096);
%ploteo
hold on 
plot(w1/(2*pi),mag2db(abs(h1)))

%disenar el filtro chebyche2
[z2,p2,k2]=cheby2(n,30,wn,'s');%30 banda de rechazo amplitud en db 
[b2,a2]=zp2tf(z2,p2,k2);
sys2=tf(b2,a2)
[h2,w2]=freqs(b2,a2,4096);
plot(w2/(2*pi),mag2db(abs(h2)))

%disenar el filtro elliptico 
[ze,pe,ke]=ellip(n,3,30,wn,'s');
[be,ae]=zp2tf(ze,pe,ke);
syse=tf(be,ae)
[he,we]=freqs(be,ae,4096);
plot(we/(2*pi),mag2db(abs(he)))

axis([0 4000 -40 5])
xlabel('Frecuncia(Hz)')
ylabel('Attenuation(dB)')
legend('Butter', 'cheby1', 'cheby2','ellip')
hold off;