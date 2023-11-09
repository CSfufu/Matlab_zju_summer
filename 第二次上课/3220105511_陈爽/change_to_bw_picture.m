function [G] = change_to_bw_picture(I)
M = change_to_grey_picture(I);
level = 0.5; 
G = M>level*255;
end