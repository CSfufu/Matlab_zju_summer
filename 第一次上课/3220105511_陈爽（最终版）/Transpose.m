function [B] = Transpose(A)
[r,coder] = size(A);
B = zeros(coder,r);
for i = 1 : r
    for j =1 : coder
        B(j,i) = A (i,j);
    end
end