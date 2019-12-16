
Rp    = 3;  % 0.5dB ripples in the passband
Rs    = 80;   % 40dB attenuation in the stopband
fs    = 8000;  % 100Hz sampling rate
fmax  = (fs/2)*2*pi; % Nyquist frequency

% [z,p,k] = ellip(6, Rp, Rs, [(390*2*pi)/fmax, (410*2*pi)/fmax],'s');
% 
% [b,a]=zp2tf(z,p,k);
% sys=tf(b,a)
% [h,w]=freqs(b,a,4096);
% figure
% plot(w/(2*pi),mag2db(abs(h)))

[A,B,C,D] = ellip(6, Rp, Rs, [(390*2*pi)/fmax, (410*2*pi)/fmax],'s');
sos = ss2sos(A,B,C,D)
freqz(sos)



%generar las senales 
Fs=1000;
T=1/Fs;%perdiodo de muestreo
L=1000;%muestras
t=(0:L-1)*T;%eje temporal 
%genero una senal senoidal 50Hz y de 120Hz
x=0.7*sin(2*pi*100*t);
y=x;%+2*randn(size(t));
figure; 
plot (Fs*t(1:10),y(1:10));
title('senal de entrada')
xlabel('tiempo(ms)')
% 
% %probamos el filtro con la senal .lsim(aplica una senal a un sistema )
% lsim(sys,y,t);%salida del sistema entender lo que hace gris entra azul sale 

% salida=lsim(sys,y,t);

salida = sosfilt(sos,y)

figure;
plot(Fs*t(1:150),salida(1:150))
title('sinal filtrada')
xlabel('time(ms)')

%demostramos que en realidad es una senal filtrada 
NFFT=2^nextpow2(L);%nextpower obtiene el multiplo de 2 mas pr0xima a 1000
Ys=fft(salida,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);%
%plot 
figure;
plot(f,2*abs(Ys(1:NFFT/2+1)));
title('Espectro de la senal filtrada')
xlabel('Frecuencia(Hz)')
ylabel('|Y(f)|')