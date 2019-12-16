function [  ] = ejerciciosis1(  )
%La salida y(T) para un sistema continuo es 2*e^(-3t)*u(T)
%Cuando la entrada es u(t). Determine
%a) h(t)
%y(T) cuando x(t)=e^(-t)*u(t)

syms s t
x=heaviside(t);
X=laplace(x)

y=2*exp(-3*t)*heaviside(t);
Y=laplace(y)

H=Y/X
h=ilaplace(H)
%..........................
x1=exp(-t)*heaviside(t);
X1=laplace(x1)

Y1=X1*H

y1=ilaplace(Y1)
%La ultima respuesta no pone el u(t) heaviside en h(t) porque cree que 
%siempre va a la derecha y es causal.
end

