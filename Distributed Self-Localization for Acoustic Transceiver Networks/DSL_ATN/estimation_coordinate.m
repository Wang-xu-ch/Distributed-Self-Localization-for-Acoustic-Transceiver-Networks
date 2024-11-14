function [h] = estimation_coordinate(Vai,tao,iter_rotate)
    
    rotate = rad2deg(iter_rotate);
    c = 343;   
    for i=1:6
        for j=1:6
            d = tao(i,j)*c;
            x = d*cosd(Vai(i,j)+rotate(i));
            y = d*sind(Vai(i,j)+rotate(i));
            coor_x(i,j) = x;
            coor_y(i,j) = y;
        end
    end
    % average for pari node
    t1 = coor_x;
    t2 = coor_y;
    for i=1:6
        for j=1:6
            coor_x(i,j) = 1/2*(t1(i,j)-t1(j,i));
            coor_y(i,j) = 1/2*(t2(i,j)-t2(j,i));
        end
    end



x1 = [coor_x(1,:);coor_y(1,:)].';
x2 = [coor_x(2,:);coor_y(2,:)].';
x3 = [coor_x(3,:);coor_y(3,:)].';
x4 = [coor_x(4,:);coor_y(4,:)].';
x5 = [coor_x(5,:);coor_y(5,:)].';
x6 = [coor_x(6,:);coor_y(6,:)].';

for k=1:100
    %node1
    node = 1;
    r1 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y1 = x1 - x1(1,:)+r1;
    %node2
    node = 2;
    r2 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y2 = x2 - x2(2,:)+r2;
    %node3
    node = 3;
    r3 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y3 = x3 - x3(3,:)+r3;
    %node4
    node = 4;
    r4 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y4 = x4 - x4(4,:)+r4;
    %node5
    node = 5;
    r5 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y5 = x5 - x5(5,:)+r5;
    %node6
    node = 6;
    r6 = (x1(node,:)+x2(node,:)+x3(node,:)+x4(node,:)+x5(node,:)+x6(node,:))/6;
    y6 = x6 - x6(6,:)+r6;
    
    x1 = y1;
    x2 = y2;
    x3 = y3;
    x4 = y4;
    x5 = y5;
    x6 = y6;

end




h = [x1(1,:);x2(2,:);x3(3,:);x4(4,:);x5(5,:);x6(6,:)];




    
end

