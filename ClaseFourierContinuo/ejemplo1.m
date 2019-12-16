function [ ] = ejemplo1( )

syms a t;
ft = heaviside(t+a)-heaviside(t-a);
Fw = fourier(ft)
Fw = simplify(Fw)

ft = subs(ft,a,1);
subplot(2,1,1)
ezplot(ft,[-2,2]);
ylim([-0.2 1.2])
xlabel('t')
ylabel('f(t)')
title('Pulso rectangular')

Fw=subs(Fw,a,1);
subplot(2,1,2)
hg=ezplot(Fw,[-10,10]);
set(hg,'color','r')
xlabel('\omega')
ylabel('F(\omega)')
title('Transformada de Fourier')
grid on

end

