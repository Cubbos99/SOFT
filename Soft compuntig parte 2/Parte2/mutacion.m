function hijos=mutacion(padres)

hijos=padres;
rng('shuffle');
for i=1:100

    random=rand();
    if random<0.02 %probabilidad de 2%. si muta, muta un 20% del individuo.
        valor_mutante= randi([1 1000],1,200);
        for j=1:200
            random2=rand();
            if random2<=0.5
                hijos(i, valor_mutante(j))=1;
            else
                hijos(i, valor_mutante(j))=0;
            end
        end    
    end
end
    
end