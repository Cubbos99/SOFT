%{
clc;
clear all;
close all;

[individuo, fitness1, grafica1]=unomasuno(0.01);
disp("Individuo");
disp(individuo);
disp("Fitness");
disp(fitness1);
axis on;
hold on;
title("UNOMASUNO");
xlabel("Nº de iteraciones");
ylabel("Fitness");
plot(grafica1, 'LineWidth', 2);
hold off;

%}


clc;
clear all;
close all;
[poblacion, fitness2, grafica2]=lambdamasmu(0.01,30,10,5);
disp("Poblacion");
disp(poblacion);
disp("Fitness");
disp(fitness2);
axis on;
hold on;
title("LAMBDAMASMU");
xlabel("Nº de iteraciones");
ylabel("Fitness");
plot(grafica2);
hold off;


