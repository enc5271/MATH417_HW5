


%problem 1
N = [10 20 40 80 160 320 ]
alphas = [0.25 0.5 0.75]

ex1 = []
ex2 =[]
ex3 = []
for n = N
    for alpha = alphas
        f1 = @(x) 1./(1.+x).^alpha
        f2 = @(x) 1./(x).^alpha
        f3 = @(x) exp((alpha-1)*x)
        
        ex1 = [ex1; n, alpha, Simpsons(0,1,n,f1), GaussLegendre(0,1,n,f1)]
        ex2 = [ex2; n, alpha, Simpsons(0,1,n,f2), GaussLegendre(0,1,n,f2)]
        ex3 = [ex3; n, alpha, Simpsons(0,1,n,f3), GaussLegendre(0,1,n,f3)]
    end
end
%double check t
actual1 = integral(f1,0,1)
actual2 = integral(f2,0,1)
actual3 = integral(f3,0,1)