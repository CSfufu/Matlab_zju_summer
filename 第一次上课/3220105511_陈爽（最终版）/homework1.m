clear;
clc;
%% 创建矩阵
m=input('m=');
n=input('n=');
A=rand(m,n);
%% 转置矩阵
B=Transpose(A);
%% 求最小值
minimal=MIN(A);
%% 求最大值
maximal=MAX(A);
%% 排序
S=Sort(A);