clear;clc;
I=load("1.mat","-mat");
M=int16(I.M);
[r,c,l]=size(M);
for i=2:c
    M(:,i,:)=M(:,i,:)+M(:,i-1,:);
end
M=uint8(M);
subplot(1,2,1);
imshow("fufu.jpg");
title("原来的图像");
subplot(1,2,2);
imshow(M);
imwrite(M,"fufu_after.jpg");
title("经过差分压缩处理之后的图像"); 