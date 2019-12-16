function [  ] = tres(  )
alpha=0.9;     
w=-pi:0.01:pi;
h=1./(1-alpha.*exp(-1i*(w)));
f=pi*linspace(-1,1,length(w));
figure
plot(f,abs(h))
figure
plot(f,angle(h))
grid
end
