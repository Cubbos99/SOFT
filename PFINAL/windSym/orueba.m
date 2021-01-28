%% Kgr Grid with Nturb Turbines
Kgr = 20;   % Tamaño del Grid
Nturb = 20; % Numero de Turbinas

HM = zeros(30, Kgr*Nturb);
fitness=zeros(1,30);


for i=1:30
    padre=zeros(20);
    padre(randperm(Kgr^2,Nturb)) = 1;     % Gen Nturb in a grid of Kgr x Kgr
    
    [pwr_T2,gan_T2,cost_T2,obj_T2] = f_powerPlantsT_fast(vVec,padre);
    fitness(i)=pwr_T2;
    vector1_400=reshape(padre,[1,400]);
    HM(i,:)=vector1_400;
end

    