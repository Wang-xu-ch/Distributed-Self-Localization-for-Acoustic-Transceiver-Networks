clc
clear;
addpath("./utils/");
addpath("./DSL_ATN/");



%% runs
T = 30;% Monte Carlo runs

load("./datas/data_S.mat");
load("./datas/data_node_ori.mat");
load("./datas/TDOA_data.mat");
load("./datas/DOA_data.mat");
L = 3;
for t=1:T
    s = data_S(:,:,t);
    node_ori = data_node_ori(:,t);
    p_nodes = s;   
    [real_TDoA,real_DoA] = real_values_for_rt(p_nodes,s,node_ori);
    
    for i=1:6
        real_DoA(i,i) = 0;
    end
    
    for RT = 200:100:600
        idx = RT/100 -1;
        TDoA = TDOA_data(:,:,:,idx,t);
        DoA = DOA_data(:,:,idx,t);
        [RMSE_P1(idx,t), MAE_TH1(idx,t)] = Iteration_fun(DoA,TDoA,real_DoA,real_TDoA);
    end
end





