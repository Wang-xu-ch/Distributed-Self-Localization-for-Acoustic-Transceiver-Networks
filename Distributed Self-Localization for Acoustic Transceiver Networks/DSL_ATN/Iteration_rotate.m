function [rotate] = Iteration_rotate(relative_theta)
%ITERATION_ROTATE iteration for rotate

relative_th = deg2rad(relative_theta);
x1 = relative_th(1,:);
x2 = relative_th(2,:);
x3 = relative_th(3,:);
x4 = relative_th(4,:);
x5 = relative_th(5,:);
x6 = relative_th(6,:);


for k=1:50
    %node1
    node = 1;
    theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y1 = x1-x1(1)+r;
    
    %node2
    node = 2;
    theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y2 = x2-x2(2)+r;
    
    %node3
    node = 3;
     theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y3 = x3-x3(3)+r;
    
    %node3
    node = 4;
    theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y4 = x4-x4(4)+r;
    
    %node5
    node = 5;
    theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y5 = x5-x5(5)+r;
    
    %node6
    node = 6;
    theta = [x1(node) x2(node) x3(node) x4(node) x5(node) x6(node)];
    r = aver(theta);
    y6 = x6-x6(6)+r;
  
    x1 = y1;
    x2= y2;
    x3= y3;
    x4= y4;
    x5 =y5;
    x6 =y6;

end
angle = [x1;x2;x3;x4;x5;x6];

rotate = diag(angle);



end

