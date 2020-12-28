function unos = funcion_fit(vector)
unos=0;
for i=1:length(vector)
    if vector(i)==1
        unos=unos+1;
    end
end
end