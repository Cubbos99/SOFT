function vector_out = cruce(vector_in)
vector_out=zeros(1,1000);
indice=1;
indice2=-9;
indice3 = 0;
for i=1:100
    indice2 = indice2+10;
    indice3 = indice3+10;
    for j=indice2:indice3
        vector_out(1, indice)=vector_in(i,j);
        indice=indice+1;
    end
end
end