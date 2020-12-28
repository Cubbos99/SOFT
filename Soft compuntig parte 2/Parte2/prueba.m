poblacion=zeros(100, 1000);
fitness=zeros(1, 100);

for i=1:100
    for j=1:1000
        poblacion(i,j) = randi([0,1]);
    end
    fitness(i)=funcion_fit(poblacion(i,:));
end
disp("POBLACION");
%disp(poblacion);
disp(fitness);

hijo1=zeros(1,1000);
hijo1=cruce(poblacion);
   
hijo2=zeros(1,1000);
hijo2=cruce2(poblacion);

fitness_hijo1=0;
fitness_hijo1=funcion_fit(hijo1);

disp("hijo1");
%disp(hijo1);
disp(fitness_hijo1);
   
fitness_hijo2=0;
fitness_hijo2=funcion_fit(hijo2);

disp("hijo2");
%disp(hijo2); 
disp(fitness_hijo2);

mejor_hijo=zeros(1,1000);
mejor_fitness_hijos=0;
if fitness_hijo1<fitness_hijo2
   mejor_hijo=hijo2;
   mejor_fitness_hijos=fitness_hijo2;
else
   mejor_hijo=hijo1;
   mejor_fitness_hijos=fitness_hijo1;
end    

disp("mejor fitness hijos");
%disp(mejor_hijo);
disp(mejor_fitness_hijos);
    
indice=0;
peor_padre=2000;
for m=1:100
   if peor_padre>fitness(m)
       peor_padre=fitness(m);
       indice=m;
   end
end

disp("fitness peor padre");
disp(fitness(indice));

if mejor_fitness_hijos>peor_padre
    poblacion(indice,:)=mejor_hijo(1,:);
    fitness(indice)=mejor_fitness_hijos;
end

disp("POBLACION");
%disp(poblacion(indice,:));
disp(fitness(indice));
