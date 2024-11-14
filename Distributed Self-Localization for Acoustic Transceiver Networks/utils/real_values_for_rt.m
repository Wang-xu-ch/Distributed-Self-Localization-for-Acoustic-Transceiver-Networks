function [real_TDoA,real_DoA] = real_values_for_rt(p_nodes,s,node_ori)

N = size(s,1);
M = N;

for n=1:N
    for i=1:M
        for j=1:M
            real_TDoA(i,j,n) = (norm(s(n,:)-p_nodes(j,:))-norm(s(n,:)-p_nodes(i,:)))/343;
        end
    end
end

for n=1:N
    for i=1:M
        real_DoA(i,n) = wrapTo180(atan2d(s(n,2)-p_nodes(i,2),s(n,1)-p_nodes(i,1)) + node_ori(i));
    end
end



end

