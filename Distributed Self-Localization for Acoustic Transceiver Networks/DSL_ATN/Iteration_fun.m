function [rmse_coor,mae_rotate] = Iteration_fun(D,T,real_DoA,real_TDoA)
%%
edge = ones(6,6);
Vai = D;

for i=1:6
    for j=1:6
        tao(i,j) = (T(i,j,i)+T(j,i,j))/2;
        real_tao(i,j) = real_TDoA(i,j,i);
    end
end


% process Doa information to get rotate angle
relative_theta = estimation_th(Vai,edge);
iter_rotate = Iteration_rotate(relative_theta);


% estimation relative coordiante
estim_coor = estimation_coordinate(Vai,tao,iter_rotate);

%% real values
real_relative_theta = estimation_th(real_DoA,edge);
real_iter_rotate = Iteration_rotate(real_relative_theta);
real_coor = estimation_coordinate(real_DoA,real_tao,real_iter_rotate);




%% calculate errors
rmse_coor = sqrt(mean(sum((real_coor-estim_coor).^2,2)));
refer_rotate = iter_rotate-iter_rotate(1);
real_refer_rotate = real_iter_rotate-real_iter_rotate(1);
th_err = refer_rotate-real_refer_rotate;

for i=1:6
    th_err(i) = min(abs([th_err(i)+2*pi,th_err(i)-2*pi,th_err(i)]));
end

mae_rotate = mean(rad2deg(th_err));



end

