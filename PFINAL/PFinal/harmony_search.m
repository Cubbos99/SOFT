clear all; close all; clc;
addpath('utils/');addpath('dt/')
load('dt/pwrCurve.mat');

%% Load Data
load('WindSym_1.mat');

%% Kgr Grid with Nturb Turbines
Kgr = 20;   % Tamaño del Grid
Nturb = 20; % Numero de Turbinas

HM = zeros(30, Kgr*Nturb);
fitness=zeros(1,30);

tic;
for i=1:30
    padre=zeros(20);
    padre(randperm(Kgr^2,Nturb)) = 1;     % Gen Nturb in a grid of Kgr x Kgr
    [pwr_T2,gan_T2,cost_T2,obj_T2] = f_powerPlantsT_fast(vVec,padre);
    fitness(i)=pwr_T2;
    vector=reshape(padre,[1,400]);
    HM(i,:)=vector;
end
toc;
fitness

for j=1:300
    %HMCR
    hijos=zeros(30,400);
    for k=1:30
        for l=1:400
            probabilidad=rand;
            if probabilidad<=0.97
                hijos(k,l)=HM(k,l);
            else
                valor_aleatorio=rand;
                if(valor_aleatorio)<=0.5
                    valor=0;
                else 
                    valor=1;
                end
                hijos(k,l)=valor;
            end
        end
    end
        
         %ajustamos 1s
    for o=1:30
       contador=0;
       for u=1:400
           if hijos(o,u)==1
               contador=contador+1;
           end
       end
       
       indices=zeros(1,contador);
       indice=1;
       for u=1:400
           if hijos(o,u)==1
               indices(indice)=u;
               indice=indice+1;
           end
       end
       
       diferencia=contador-20; 
       if diferencia>0               
            while(diferencia~=0)
                numero = randsample(indices,1);                
                if hijos(o,numero)==1
                    hijos(o,numero)=0;
                    diferencia=diferencia-1;
                end
            end
       
        elseif diferencia<0           
            while(diferencia~=0)
                numero=(400-1).*rand(1)+1;
                numero=int16(numero);
                if hijos(o,numero)==0
                    hijos(o,numero)=1;
                    diferencia=diferencia+1;
                end
            end        
        end         
    end
    
     %PAR
    for s=1:30       
        for d=1:400          
            probabilidad_par=rand;
            if(probabilidad_par<=0.03)
                valor_aleatorio_par=rand;
                if(valor_aleatorio_par)<=0.5
                    valor=0;
                else 
                    valor=1;
                end
            hijos(s,d)=valor;
            end
        end
    end
     
    %ajustamos 1s
    for o=1:30
       contador=0;
       for u=1:400
           if hijos(o,u)==1
               contador=contador+1;
           end
       end
       
       indices=zeros(1,contador);
       indice=1;
       for u=1:400
           if hijos(o,u)==1
               indices(indice)=u;
               indice=indice+1;
           end
       end
       
       diferencia=contador-20; 
       if diferencia>0
                
            while(diferencia~=0)
                numero = randsample(indices,1);
                
                if hijos(o,numero)==1
                    hijos(o,numero)=0;
                    diferencia=diferencia-1;
                end
            end
       
        elseif diferencia<0
            
            while(diferencia~=0)
                numero=(400-1).*rand(1)+1;
                numero=int16(numero);
                if hijos(o,numero)==0
                    hijos(o,numero)=1;
                    diferencia=diferencia+1;
                end
            end        
        end 
    end      
      
    
    %calcular fitness
    for y=1:30
        
        hijos_matriz=reshape(hijos(y,:),[20,20]);     
        [pwr_T2_hijo,gan_T2,cost_T2,obj_T2] = f_powerPlantsT_fast(vVec,hijos_matriz);    
        if fitness(y)<pwr_T2_hijo
            HM(y,:)=hijos(y,:);
            fitness(y)=pwr_T2_hijo;
        end
    end
    
    %presentar resultados
    if j==300
        fitness
        ordenado=sort(fitness);
        fprintf('El mejor fitness es: %d \n',ordenado(30));
    end
end


