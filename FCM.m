clear all;
clc;
img1 = imread(uigetfile('.jpg'));
img1 = rgb2gray(img1);
img1 = double(img1);

data1 = img1(:);

%����FCM�����ֳ�2��
[center1,U1,obj_fcn1] = fcm(data1,2);

%�ҵ���������
[~,label1] = max(U1);

%�仯��ͼ��Ĵ�С
img_new1 = reshape(label1,size(img1));

figure
subplot(1,2,1),imshow(img1,[]);title('�Ҷ�ͼ��1');
subplot(1,2,2),imshow(img_new1,[]);title('fcm�ָ�ͼ��1');

