function [  ] = ejemplo4(  )
%   x(t) = te^(-3t)

syms t w
x = t*exp(-3*t)*heaviside(t);
X = fourier(x,w);
w = -20:0.1:20;
X = subs(X,w)
plot(w,abs(X));
legend('magnitud')
figure
plot(w,angle(X))
legend('angle')

end

