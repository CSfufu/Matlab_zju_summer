clear;
clc;
[fillname,path]=uigetfile('*.jpg');
fullpath=fullfile(path,fillname);
I=imread(fullpath);
subplot(221);
imshow(I);
xlabel("原始的图像");
%% 创建一个滤波器并且进行拉普拉斯变换
filter = fspecial("laplacian");
[r,c,l]=size(I);
[m,n]=size(filter);
% 对所选的滤波器进行判断
if mod(m,2)*mod(n,2)==0
    print("重新更换滤波器")
    return
end
botm=-floor(m/2);botn=-floor(n/2);
lap=zeros(r,c,l);
I=double(I);
for i=1:r
    for j=1:c
        for k=botm:m/2
            for p=botn:n/2
                a=i+k;b=j+p;
                a(a<1)=1;a(a>r)=r;
                b(b<1)=1;b(b>c)=c;
                lap(i,j,:)=lap(i,j,:)+double(filter(ceil(m/2)+k,ceil(n/2)+p))*I(a,b);
            end
        end
    end
end
if lap>0
    las=lap+double(I);
else
    las=-lap+double(I);
end
subplot(222);
imshow(lap);
xlabel("拉普拉斯变换之后的图像");
subplot(223);
imshow(lap,[]);
xlabel("归约化后的拉普拉斯图像");
las=uint8(las);
las(las<0)=0;las(las>255)=255;
subplot(224);
imshow(las);
xlabel("经过拉普拉斯算子变换之后增强的图像");
imwrite(las,"las_after.jpg");
         
              