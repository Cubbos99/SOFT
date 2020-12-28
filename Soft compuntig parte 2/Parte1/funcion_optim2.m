function [hijo_fit]=funcion_optim2(hijos)

hijo_fit=0;
for i = 1:10
    for j=1:30
        for k=1:5
            hijo_fit=(sum(hijos(i,j,k))^2);
        end
    end
end