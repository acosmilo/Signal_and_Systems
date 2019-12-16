function [  ] = mifft_ejer(  )
      
L = 10;             
t = (0:L-1);        
n=0:1:10;
x = escalon(n)-escalon(n-20);



figure
stem(n,x)
title('Signal Pulso Rectangular')
xlabel('n')
grid
 
 NFFT = 512;
 Y=fft(x,NFFT);
 Y1=fftshift(Y);
 w=pi*linspace(-1,1,NFFT);

 figure
 plot(w,abs(Y1))
 title('Transformada de Fourier')
 xlabel('Frecuency (rad)')

grid
end
