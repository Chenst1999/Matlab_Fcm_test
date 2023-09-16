clear all;
clc;
img1 = double(imread(uigetfile('.bmp')));
img2 = double(imread(uigetfile('.bmp')));
img3 = double(imread(uigetfile('.bmp')));
img4 = double(imread(uigetfile('.bmp')));
data1 = img1(:);
data2 = img2(:);
data3 = img3(:);
data4 = img4(:);
%����FCM�����ֳ�2��
[center1,U1,obj_fcn1] = fcm(data1,2);
[center2,U2,obj_fcn2] = fcm(data2,2);
[center3,U3,obj_fcn3] = fcm(data3,2);
[center4,U4,obj_fcn4] = fcm(data4,2);
%�ҵ���������
[~,label1] = max(U1);
[~,label2] = max(U2);
[~,label3] = max(U3);
[~,label4] = max(U4);
%�仯��ͼ��Ĵ�С
img_new1 = reshape(label1,size(img1));
img_new2 = reshape(label2,size(img2));
img_new3 = reshape(label3,size(img3));
img_new4 = reshape(label4,size(img4));
figure
subplot(2,4,1),imshow(img1,[]);title('�Ҷ�ͼ��1');
subplot(2,4,2),imshow(img2,[]);title('�Ҷ�ͼ��2');
subplot(2,4,3),imshow(img3,[]);title('�Ҷ�ͼ��3');
subplot(2,4,4),imshow(img4,[]);title('�Ҷ�ͼ��4');
subplot(2,4,5),imshow(img_new1,[]);title('fcm�ָ�ͼ��1');
subplot(2,4,6),imshow(img_new2,[]);title('fcm�ָ�ͼ��2');
subplot(2,4,7),imshow(img_new3,[]);title('fcm�ָ�ͼ��3');
subplot(2,4,8),imshow(img_new4,[]);title('fcm�ָ�ͼ��4');
