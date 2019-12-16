function [  ] = uno(  )
      
w=-pi:0.01:pi;
h=2*1i.*exp(-1i*(w/2)).*sin(w/2);
f=pi*linspace(-1,1,length(w));
figure
plot(f,abs(h))
figure
plot(f,angle(h))
grid
end
