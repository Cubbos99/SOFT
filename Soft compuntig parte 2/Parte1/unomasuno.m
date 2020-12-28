
function [individuo, individuo_fit, grafica_fitness] = unomasuno(sigma)

individuo = -100+(100+100)*rand(1, 30)
individuo_fit = funcion_optim(individuo)
grafica_fitness=zeros(1, 300001);
grafica_fitness(1)=individuo_fit;
for i = 1:300000
    hijo=individuo+(randn(1,30)*sigma);
    
    for j=1:30
        if hijo(j)>100
            hijo(j)=100;
        elseif hijo(j)<(-100)
            hijo(j)=-100;
        end
    end
    
    hijo_fit=funcion_optim(hijo);
    
    
   if hijo_fit < individuo_fit
       individuo_fit = hijo_fit;
       individuo = hijo;
   end
   grafica_fitness(i+1)=individuo_fit;
end



