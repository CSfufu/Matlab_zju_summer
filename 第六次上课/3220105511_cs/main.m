clear;
clc;
[filename,path] = uigetfile('*.*');
fullpath = fullfile(path,filename);
I = imread(fullpath);
subplot(1,3,1);
imshow(I);
xlabel("原始图像");
[r,c,l]=size(I);
I=double(I);
R=floor(r/8);
C=floor(c/8);
threshold=1;
M=I;
%% 对图像进行Harr小波编码
for i=1:l
    for j=1:R
        for k=1:C
            M((j-1)*8+1:j*8,(k-1)*8+1:k*8,i)=Haar_positive(I((j-1)*8+1:j*8,(k-1)*8+1:k*8,i));
        end
    end
end
%% 将绝对值小于阈值的数抹去
M(abs(M)<threshold)=0;
M=int16(M);
save('data.mat','M');
Harr_image=uint8(M);
subplot(1,3,2);
imshow(Harr_image);
xlabel("Harr小波编码之后得到的图片");
%% 进行Huffman二进制编码
[r,c,l]=size(M);
SIG=M(:);
k=unique(SIG);
P=zeros(1,length(k(:)));
for i=1:length(k(:))
    P(1,i)=length(find(SIG==k(i)))/length(SIG(:));
end
dict=huffmandict(k,P);
enco=huffmanenco(SIG,dict);
save("huffen.mat","enco");
%% 对Huffman二进制编码进行解码
load('huffen.mat',"enco");
deco=huffmandeco(enco,dict);
%% 计算效率
efficiency=size(enco)/(size(deco)*8);
%% 输出解码之后的图片
Ide=reshape(deco,[r,c,l]);
Ide=double(Ide);
B=zeros(r,c,l);
for i=1:l
    for j=1:R
        for k=1:C
            B((j-1)*8+1:j*8,(k-1)*8+1:k*8,i)=harr_negative(Ide((j-1)*8+1:j*8,(k-1)*8+1:k*8,i));
        end
    end
end
B=uint8(B);
subplot(1,3,3);
imshow(B);
xlabel('经过解码之后输出的图像');
title(sprintf("压缩效率是： %.2f%%",efficiency*100));
