function [ r ] = GaussLegendre2( a,b,N,f )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c1 = 1;
c2 = 1;
root1 = -sqrt(3)/3;
root2 = sqrt(3)/3;
h = 1/N;


sum = 0;
x1=0;
x2=0;
for i = 1:N-1
    x = a+(i+1)*h;
    %x1 = a+i*h
    %x2 = a+i*(h+1)
    sum = sum +  h/2*(f(x+h*(root1-1)/2)+f(x+h*(root2-1)/2));
end
r = sum
end

