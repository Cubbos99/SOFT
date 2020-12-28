function hijos = cruce1punto(padres)

hijos=zeros(100,1000);
puntodecruce=int16(rand()*1000);

for i=1:100
    for j=1:puntodecruce
        hijos(i,j)=padres(i,j);
    end
    indice=puntodecruce+1;
    for k=indice:1000
        if i~=100
            indice2=i+1;
            hijos(i,k)=padres(indice2,k); 
        else
            hijos(100,k)=padres(1,k);
        end
    end
end

end