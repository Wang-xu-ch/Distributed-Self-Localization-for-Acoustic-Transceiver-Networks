function [real_TDoA,real_DoA] = real_TDOA_DOA(mic_pos,s,node_ori)

L = 3;
M = size(mic_pos,1)/L;
N = size(s,1);


for n=1:N
    for i=1:M
        for j=1:M
            real_TDoA(i,j,n) = (norm(s(n,:)-mic_pos((j-1)*L+1,:))-norm(s(n,:)-mic_pos((i-1)*L+1,:)))/343;
        end
    end
end


for n=1:N
    for i=1:M
        real_DoA(i,n) = wrapTo180(atan2d(s(n,2)-mic_pos((i-1)*L+1,2),s(n,1)-mic_pos((i-1)*L+1,1)) + node_ori(i));
    end
end







end

