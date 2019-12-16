function [  ] = ejemplo2( )

%%x(t)= cos(t)
syms t w
x = cos(t);
X = fourier(x,w);
w1 = -4:0.05:4;
X = subs(X,w,w1);

for i = 1:length(X)
if X(i) == inf
    X(i) = 1;
end
end
plot(w1,X,'.r')
legend('F[cos(t)]')


end

