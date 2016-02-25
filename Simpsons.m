function [ r ] = Simpsons( a,b,N,f )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

h = (b-a)/N;
sum =0;
x0 = f(a)+f(b);
x1=0;
x2=0;
for i = 1:N-1
    x = a+i*h;
    if (mod(i,2)==0)
        x2 = x2 +f(x);
    else
        x1 = x1 +f(x);
    end
end
r = h/3*(x0+2*x2+4*x1);
end

