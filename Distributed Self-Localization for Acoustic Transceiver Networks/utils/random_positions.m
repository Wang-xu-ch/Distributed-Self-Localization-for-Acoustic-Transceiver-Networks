function [mic_pos,s,node_ori] = random_positions(M_num)



node_pos = zeros(M_num, 2);

for i = 1:M_num
    while true
        x = rand * 10;
        y = rand * 10;
        
        if all(vecnorm(node_pos(1:i-1, :) - [x, y], 2, 2) > 1e-6)
            node_pos(i, :) = [x, y];  
            break;  
        end
    end
end






s = node_pos;
L = 3;      % each node consists of 3 mics
node_ori = [0 360*rand(1,M_num-1)];

for i=1:M_num
    mic_pos((i-1)*L+1,:) = [0 0]*Rotmatrix(node_ori(i))+node_pos(i,1:2);
    mic_pos((i-1)*L+2,:) = [0 0.05]*Rotmatrix(node_ori(i))+node_pos(i,1:2);
    mic_pos((i-1)*L+3,:) = [0.05 0]*Rotmatrix(node_ori(i))+node_pos(i,1:2);
    
end








end

