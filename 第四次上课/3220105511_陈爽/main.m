clear;
clc;
I = imread("cy.jpg");
scale = input("请输入缩放的倍数: ");
J = customResize(I,scale);
%J = uint8(J);
subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(J);
axis image;
imwrite(J,"cy_after.jpg");