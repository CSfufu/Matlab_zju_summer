clear;
clc;
%% 首先读取文件
[fillname,path]=uigetfile("*.*");
fullpath=fullfile(path,fillname);
I=imread(fullpath);
subplot(221);imshow(I);
xlabel("原始图像");
%% 边缘检测
M = rgb2gray(I);
[BW,thresh]=edge(M,"canny");
subplot(222);imshow(BW);
xlabel("经过边缘检测之后得到的结果");
%% 画直线
[H,theta,rho]=hough(BW);
peaks=houghpeaks(H,3);
lines=houghlines(BW,theta,rho,peaks);
subplot(223);imshow(I);
hold on;
xlabel("长度最长的三条直线");
for i=1:3
    L=[lines(i).point1;lines(i).point2];
    plot(L(:,1),L(:,2),"LineWidth",2);
end
%% 最大的面积区域
subplot(224);imshow(I);
hold on;
xlabel("面积最大的三个区域");
bw = imbinarize(M);
[B,L]=bwboundaries(bw,4);
tbl=tabulate(L(:));
tbl=sortrows(tbl,2);
count=0;
for i=1:3
    if tbl(length(tbl)-i-count,1)==0
        count =count+1;
        countinue
    end
    boun=B{tbl(length(tbl)-i-count,1)};
    plot(boun(:,2),boun(:,1),'LineWidth',2,'Color','green');
end
