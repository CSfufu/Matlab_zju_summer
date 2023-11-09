clear
clc
%% Read in a RGB image
I = imread("cy.jpg");
%% Convert to grey image
GREY = change_to_grey_picture(I);
imwrite(GREY,"change_to_grey_picture.jpg");
figure("Name","change");
subplot(2,2,1);
imshow(GREY);
%% Count the number of the grey
Grey_number = count_greynumber(GREY);
subplot(2,2,2);
bar(0:255,Grey_number);
xlabel("Pixel values");
ylabel("Number");
%% Convert to bw image
BW = change_to_bw_picture(I);
imwrite(BW,"change_to_bw_picture.jpg");
subplot(2,2,3);
imshow(BW);
%% Count the number of the bw
BW_number = count_bwnumber(BW);
subplot(2,2,4);
bar(0:1,BW_number);
xlabel("Pixel values");
ylabel("Number");