function [  ] = dos(  )
      
        
n=0:1:10;
x =[1 -1 0 0 0 0 0 0 0 0 0];



figure
stem(n,x)
title('Signal Pulso Rectangular')
xlabel('n')
grid
 
 NFFT = 128;
 Y=fft(x,NFFT);
 Y1=fftshift(Y);
 w=pi*linspace(-1,1,NFFT);

 figure
 plot(w,abs(Y1))
 title('Transformada de Fourier')
 xlabel('Frecuency (rad)')

grid
end