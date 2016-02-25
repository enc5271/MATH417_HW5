%problem 1
N = [10 20 40 80 160 320 ]
alphas = [0.25 0.5 0.75]

ex1 = []
ex2 =[]
ex3 = []
%problem 1 alphas 0.25 0.5 0.75
exact1_1= 0.9090571073 ;
exact1_2= 0.8284271247;
exact1_3= 0.75682846;

%problem 2 exact soln
exact2_1=(4/3);
exact2_2=2.0;
exact2_3=4.0;
for n = N
    for alpha = alphas
        f1 = @(x) 1./(1.+x).^alpha
        f2 = @(x) 1./(x).^alpha
        f3 = @(x) exp((alpha-1)*x)
        if (alpha == 0.25)
            ex1 = [ex1; n, alpha, Simpsons(0,1,n,f1), GaussLegendre(0,1,n,f1), abs(exact1_1-Simpsons(0,1,n,f1)), abs(exact1_1-GaussLegendre(0,1,n,f1))]
            ex2 = [ex2; n, alpha, GaussLegendre(0,1,n,f2), abs(GaussLegendre(0,1,n,f2)-exact2_1)]
        elseif (alpha == 0.5)
            ex1 = [ex1; n, alpha, Simpsons(0,1,n,f1), GaussLegendre(0,1,n,f1), abs(exact1_2-Simpsons(0,1,n,f1)), abs(exact1_2-GaussLegendre(0,1,n,f1))]
            ex2 = [ex2; n, alpha, GaussLegendre(0,1,n,f2), abs(GaussLegendre(0,1,n,f2)-exact2_2)]
        elseif(alpha == 0.75)
            ex1 = [ex1; n, alpha, Simpsons(0,1,n,f1), GaussLegendre(0,1,n,f1), abs(exact1_3-Simpsons(0,1,n,f1)), abs(exact1_3-GaussLegendre(0,1,n,f1))]
            ex2 = [ex2; n, alpha, GaussLegendre(0,1,n,f2), abs(GaussLegendre(0,1,n,f2)-exact2_3)]
            
        end
    end
end

M = [4 8 16 32 64];
for n = M
    for alpha = alphas
        f3 = @(x) exp((alpha-1)*x)
        if (alpha == 0.25)
            ex3 = [ex3; n, alpha, Simpsons2(0,1,n,f3,alpha), abs(exact2_1-Simpsons2(0,1,n,f3,alpha))]
        elseif (alpha == 0.5)
            ex3 = [ex3; n, alpha, Simpsons2(0,1,n,f3,alpha), abs(exact2_2-Simpsons2(0,1,n,f3,alpha))]
        elseif(alpha == 0.75)
            ex3 = [ex3; n, alpha, Simpsons2(0,1,n,f3,alpha), abs(exact2_3-Simpsons2(0,1,n,f3,alpha))]
        end
    end
end

