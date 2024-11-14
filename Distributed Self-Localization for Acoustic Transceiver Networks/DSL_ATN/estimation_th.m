function[final_theta] = estimation_th(Vai,edge)

    for i=1:6
        list = [];
        for j=1:6
            if(edge(i,j)==1)
                if(i~=j)
                    list = [list j];
                end
            end
        end
        theta(i,:) = wrapTo180(LS(i,list,Vai));
    end
    for i=1:6
        for j=1:6
            if(wrapTo180(theta(i,j))+wrapTo180(theta(j,i))>1)
                theta_ij = wrapTo180(mod(Vai(i,j)-Vai(j,i)-180,360));
                theta_ji = wrapTo180(mod(Vai(j,i)-Vai(i,j)-180,360));
                
                err1 = abs(wrapTo180(theta(j,i))-theta_ji);
                err2 = abs(wrapTo180(theta(i,j))-theta_ij);
                if(err1<err2)
                    final_theta(i,j) = theta(i,j);
                    final_theta(j,i) = -final_theta(i,j);
                else
                    final_theta(j,i) = theta(j,i);
                    final_theta(i,j) = -final_theta(j,i);
                end
                
            else
                final_theta(i,j) = theta(i,j);
                final_theta(j,i) = theta(j,i);
            end
            
        end
    end
    for i=1:6
        for j=1:6
            if(wrapTo180(final_theta(i,j))+wrapTo180(final_theta(j,i))>1)
                fprintf("error");
            end
            
        end
    end
    
    
    
final_theta = wrapTo180(final_theta);




