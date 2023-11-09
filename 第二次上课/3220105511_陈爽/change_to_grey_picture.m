function [M] = change_to_grey_picture(I)
[r,c,~] = size(I);
M = zeros(r,c,'uint8');
M(:,:) = 0.2989*I(:,:,1)+0.5870*I(:,:,2)+.1140*I(:,:,3);
end