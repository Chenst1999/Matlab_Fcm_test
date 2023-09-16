clear all；
clc;
%创建200个随机坐标点例子
for i=1:200  
    x1(i) = rand()*5;      %人为保证差异性  
    y1(i) = rand()*5;    
    x2(i) = rand()*5 + 3; %人为保证差异性  
    y2(i) = rand()*5 + 3;
end
%将两个类别的点坐标放到data中
x = [x1,x2];  
y = [y1,y2];  
data = [x;y];
%转置下使每一行代表一个样本
data = data';

cluster_n = 10;%类别数
iter = 50;%迭代次数
m = 2;%指数
 
num_data = size(data,1);%样本个数
num_d = size(data,2);%样本维度
%--初始化隶属度u，条件是每一列和为1
U = rand(cluster_n,num_data);
%根据每列和对元素归一化
col_sum = sum(U);
U = U./col_sum(ones(cluster_n,1),:);

%循环--规定迭代次数作为结束条件
for i = 1:iter
    %更新每个类的类中心ci
    for j = 1:cluster_n
        u_ij_m = U(j,:).^m;
        sum_u_ij = sum(u_ij_m);
        sum_1d = u_ij_m./sum_u_ij; 
        c(j,:) = u_ij_m*data./sum_u_ij;
    end
    %计算目标函数J
    temp1 = zeros(cluster_n,num_data);
    for j = 1:cluster_n
        for k = 1:num_data
            temp1(j,k) = U(j,k)^m*(norm(data(k,:)-c(j,:)))^2;
        end
    end
    J(i) = sum(sum(temp1));
    %更新大小为c*N的隶属矩阵U
    for j = 1:cluster_n
        for k = 1:num_data
            sum1 = 0;
            for j1 = 1:cluster_n
                temp = (norm(data(k,:)-c(j,:))/norm(data(k,:)-c(j1,:))).^(2/(m-1));
                sum1 = sum1 + temp;
            end
            U(j,k) = 1./sum1;
        end
    end
end
figure;
subplot(1,2,1);
plot(J);
title('迭代效率图');
%label记录每个坐标点最大隶属值所属类别
[~,label] = max(U); 
%制作散点图
subplot(1,2,2);
gscatter(data(:,1),data(:,2),label)
title('分类图');