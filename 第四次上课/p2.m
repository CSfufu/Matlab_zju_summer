clear all;
clc;
I=imread("fufu.jpg");
I2=imresize(I,0.5,'nearest');
I3=imresize(I,5,"bilinear");
subplot(231);imshow(I);
subplot(232);imshow(I2);
subplot(2,2,3);imshow(I3);
%subplot(2,2,4);imshow(I1);