clear all��
clc;
%����200��������������
for i=1:200  
    x1(i) = rand()*5;      %��Ϊ��֤������  
    y1(i) = rand()*5;    
    x2(i) = rand()*5 + 3; %��Ϊ��֤������  
    y2(i) = rand()*5 + 3;
end
%���������ĵ�����ŵ�data��
x = [x1,x2];  
y = [y1,y2];  
data = [x;y];
%ת����ʹÿһ�д���һ������
data = data';

cluster_n = 10;%�����
iter = 50;%��������
m = 2;%ָ��
 
num_data = size(data,1);%��������
num_d = size(data,2);%����ά��
%--��ʼ��������u��������ÿһ�к�Ϊ1
U = rand(cluster_n,num_data);
%����ÿ�кͶ�Ԫ�ع�һ��
col_sum = sum(U);
U = U./col_sum(ones(cluster_n,1),:);

%ѭ��--�涨����������Ϊ��������
for i = 1:iter
    %����ÿ�����������ci
    for j = 1:cluster_n
        u_ij_m = U(j,:).^m;
        sum_u_ij = sum(u_ij_m);
        sum_1d = u_ij_m./sum_u_ij; 
        c(j,:) = u_ij_m*data./sum_u_ij;
    end
    %����Ŀ�꺯��J
    temp1 = zeros(cluster_n,num_data);
    for j = 1:cluster_n
        for k = 1:num_data
            temp1(j,k) = U(j,k)^m*(norm(data(k,:)-c(j,:)))^2;
        end
    end
    J(i) = sum(sum(temp1));
    %���´�СΪc*N����������U
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
title('����Ч��ͼ');
%label��¼ÿ��������������ֵ�������
[~,label] = max(U); 
%����ɢ��ͼ
subplot(1,2,2);
gscatter(data(:,1),data(:,2),label)
title('����ͼ');