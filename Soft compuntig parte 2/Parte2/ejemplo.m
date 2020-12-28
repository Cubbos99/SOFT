%{
clc; clear all;
poblacion=zeros(2,10)
hijo=[1,2,3,4,5,6,7,8,9, 10];

poblacion(2,:)=hijo
%}
%{
poblacion=zeros(100, 1000);
fitness=zeros(1, 100);

for i=1:100
    for j=1:1000
        poblacion(i,j) = randi([0,1]);
    end
    fitness(i)=funcion_fit(poblacion(i,:));
end


poblacion(1,:)
%}

poblacion=zeros(4, 12);

for i=1:4
    for j=1:12
        poblacion(i,j) = randi([0,1]);
    end
end
poblacion
vector_out=zeros(1,12);
indice=1;
indice2=15;
indice3 = 13;
for i=1:4
    indice2 = indice2-3;
    indice3 = indice3-3;
    for j=indice2:-1.0:indice3
        vector_out(1, indice)=poblacion(i,j);
        indice=indice+1;
    end
end

vector_out
