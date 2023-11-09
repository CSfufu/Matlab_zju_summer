clear all;
clc;
[filename,path]=uigetfile("*.*");
fullpath=fullfile(path,filename);
I=imread(fullpath);
I=rgb2gray(I);
imwrite(I,"zzy2.jpg");