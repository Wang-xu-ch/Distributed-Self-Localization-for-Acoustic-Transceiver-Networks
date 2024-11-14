clc
clear;

addpath("./utils/");
addpath("./DSL_ATN/");

%% parameters
K = 20;% Monte Carlo runs
M_num = 6;
%% runs
T = 20;
for t=1:T
    [mic_pos,s,node_ori] = random_positions(M_num);
    for DOA_err = 2:2:10
        for TDOA_err = 2:2:10
            for k=1:K
                fprintf('beginning of DoA_err = %d, TDoA_err = %d [ms] , round = %d \n', DOA_err,TDOA_err/10, k);
                [real_TDoA,real_DoA] = real_TDOA_DOA(mic_pos,s,node_ori);
                [DoA,TDoA] = doa_tdoa_err(real_DoA,real_TDoA,DOA_err,TDOA_err);
                for i=1:M_num 
                    real_DoA(i,i) = 0;
                end
                [rmse_coor(TDOA_err/2,DOA_err/2,k,t),mae_rotate(TDOA_err/2,DOA_err/2,k,t)] = Iteration_fun(DoA,TDoA,real_DoA,real_TDoA);
                fprintf('ending of DoA_err = %d [deg], TDoA_err = %d [ms], round = %d \n', DOA_err,TDOA_err/10, k);
            end
        end
    end
end





