clear all;
clc;
img1 = imread(uigetfile('.jpg'));
img1 = rgb2gray(img1);
img1 = double(img1);

data1 = img1(:);

%调用FCM函数分成2类
[center1,U1,obj_fcn1] = fcm(data1,2);

%找到所属的类
[~,label1] = max(U1);

%变化到图像的大小
img_new1 = reshape(label1,size(img1));

figure
subplot(1,2,1),imshow(img1,[]);title('灰度图像1');
subplot(1,2,2),imshow(img_new1,[]);title('fcm分割图像1');

