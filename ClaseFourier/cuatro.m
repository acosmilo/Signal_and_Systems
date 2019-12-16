function [  ] = cuatro(  )
      
alpha=0.9;       
n=0:1:1000;
x =0.9.^(n);



figure
stem(n,x)
title('Signal Pulso Rectangular')
xlabel('n')
grid
 
 NFFT = 9000;
 Y=fft(x,NFFT);
 Y1=fftshift(Y);
 w=pi*linspace(-1,1,NFFT);

 figure
 plot(w,abs(Y1))
 title('Transformada de Fourier')
 xlabel('Frecuency (rad)')

grid
end