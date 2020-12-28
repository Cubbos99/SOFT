
function individuo_fit = funcion_optim(individuo)

individuo_fit=0;

for i=1:length(individuo)
   individuo_fit=individuo_fit+(individuo(i)^2);
end

