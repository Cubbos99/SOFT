function [poblacion, poblacion_fit, grafica_fitness] = lambdamasmu(sigma, tam_pob, lambda, mu)

poblacion = -100+(100+100)*randn(lambda, tam_pob)

poblacion_fit=zeros(1,lambda);
grafica_fitness=zeros(100001, lambda);


for i=1:lambda
    poblacion_fit(i) = funcion_optim(poblacion(i,:))
end

grafica_fitness(1,:)=poblacion_fit;

for j = 1:100000
   
   for k=1:lambda
       hijos=zeros(mu, tam_pob);
       hijos_fitness=zeros(1,mu);
       for l=1:mu
           hijos(l,:)=(poblacion(k,:)+(randn(1, tam_pob)*sigma));  
       end
       
       hijos=comprobar_hijos(hijos, tam_pob, mu);
       
       for m=1:mu
          hijos_fitness(m)=funcion_optim(hijos(m,:));
          if hijos_fitness(m)<poblacion_fit(k)
              poblacion(k,:)=hijos(m,:);
              poblacion_fit(k)=hijos_fitness(m);
          end
       end
       
   end
   grafica_fitness(j+1,:)=poblacion_fit;
end
end
function hijos_dev = comprobar_hijos(hijos, tam_pob, mu)
    for i=1:mu
        for j=1:tam_pob
            if hijos(i,j)<-100
                hijos_dev(i,j)=-100;
            elseif hijos(i,j)>100
                hijos_dev(i,j)=100;
            else 
                hijos_dev(i,j)=hijos(i,j);
            end
        end
    end
end

