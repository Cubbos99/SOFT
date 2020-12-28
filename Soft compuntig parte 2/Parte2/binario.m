function [poblacion, fitness]=binario(n_iteraciones, n_individuos, longitud)

poblacion=zeros(n_individuos, longitud);
fitness=zeros(1, n_individuos);

for i=1:n_individuos
    for j=1:longitud
        poblacion(i,j) = randi([0,1]);
    end
    fitness(i)=funcion_fit(poblacion(i,:));
end
poblacion
fitness

hijos=zeros(n_individuos, longitud);
fitness_hijos=zeros(1, n_individuos);

for k=1:n_iteraciones
    hijos_cruce=cruce1punto(poblacion);
    hijos_mutados=mutacion(hijos_cruce);
    for m=1:n_individuos
        fitness_hijos(m)=funcion_fit(hijos_mutados(m,:));
        if fitness_hijos(m)>fitness(m)
            poblacion(m,:)=hijos_mutados(m,:);
            fitness(m)=fitness_hijos(m);
        end
    end
end
%{
for k=1:n_iteraciones
    hijo1=zeros(1,longitud);
    hijo1=cruce(poblacion);
    
    hijo2=zeros(1,longitud);
    hijo2=cruce2(poblacion);
    
    fitness_hijo2=0;
    fitness_hijo2=funcion_fit(hijo2);
    
    fitness_hijo1=0;
    fitness_hijo1=funcion_fit(hijo1);
    
    mejor_hijo=zeros(1,longitud);
    mejor_fitness_hijos=0;
    if fitness_hijo1<fitness_hijo2
        mejor_hijo=hijo2;
        mejor_fitness_hijos=fitness_hijo2;
    else
       mejor_hijo=hijo1;
       mejor_fitness_hijos=fitness_hijo1;
    end    
    
    indice=0;
    peor_padre=2000;
    for m=1:n_individuos
        if peor_padre>fitness(m)
            peor_padre=fitness(m);
            indice=m;
        end
    end
    if mejor_fitness_hijos>peor_padre
        poblacion(indice,:)=mejor_hijo(1,:);
        fitness(indice)=mejor_fitness_hijos;
    end
end
%}
hijos



end