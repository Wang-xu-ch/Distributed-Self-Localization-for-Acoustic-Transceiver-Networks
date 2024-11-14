function [theta] = choosetheta(p1,p2,p)
diff = p1-p2;
K1 = p;
K2 = p+360;
K3 = p-360;
d1 = abs(K1-diff);
d2 = abs(K2-diff);
d3 = abs(K3-diff);
[m,index]=min([d1,d2,d3]);
if(index==1)
    theta = K1;
elseif index==2
    theta = K2;
else
    theta = K3;
end
end