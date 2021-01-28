function [poblacion, fitness, grafica]=binario(n_iteraciones, n_individuos, longitud)

poblacion=zeros(n_individuos, longitud);
fitness=zeros(1, n_individuos);
grafica=zeros(n_iteraciones, n_individuos);
for i=1:n_individuos
    for j=1:longitud
        poblacion(i,j) = randi([0,1]);
    end
    fitness(i)=funcion_fit(poblacion(i,:));
end
grafica(1,:)=fitness;
poblacion
fitness

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
    grafica(k+1,:)=fitness;
end
end
