function [ ] = ejemplo2(b,z0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
b, z0;
syms a w w0;
Xw = (heaviside(w+a-w0)-heaviside(w-a-w0)+heaviside(w+a+w0)-heaviside(w-a+w0));
IF = ifourier(Xw,'t');

Xw = 0.5*Xw
IF = 0.5*IF;
IF = simplify(IF)

Xw = subs(Xw,a,b);
Xw = subs(Xw,w0,z0);
subplot(2,1,1)
ezplot(Xw,[-(b+z0+2),b+z0+2]);
ylim([-0.2 0.7])
xlabel('\Omega')
ylabel('X(\Omega)')
title('Dos Pulsos rectangulares en \Omega')


IF=subs(IF,a,b);
IF=subs(IF,w0,z0);

subplot(2,1,2)
hg=ezplot(IF,[-100,100]);
set(hg,'color','r')
xlabel('t')
ylabel('F(t)')
title('Transformada de Inversa de Fourier')
grid on


end

