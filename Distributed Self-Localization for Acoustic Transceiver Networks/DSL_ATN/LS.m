function [theta] = LS(node,list,Vai)
    L = length(list);
    
    A = [eye(L);-ones(L-1,1) eye(L-1)];
    
    for i=1:L-2
        A = [A;zeros(L-i-1,i) -ones(L-i-1,1) eye(L-i-1)];
    end
    for i=1:L
        P(i) = mod(Vai(node,list(i))-Vai(list(i),node)-180,360);
    end
    i=i+1;
    for j=1:L
        for k=j+1:L
            P(i) = mod(Vai(list(j),list(k))-Vai(list(k),list(j))-180,360);
            P(i) = choosetheta(P(k),P(j),P(i));
            i = i+1;
        end
    end
    
        
        
    th = ((A.')*A)^(-1)*(A.')*(P.');
    for i=1:6
        if(i~=node)
            theta(i) = Inf;
        else
            theta(i) = 0;
        end
    end
    for i=1:L
        theta(list(i)) = th(i);
    end

end

