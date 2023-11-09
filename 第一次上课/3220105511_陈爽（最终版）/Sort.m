function [S] = Sort(A)
[r,coder] = size(A);
S = zeros(r*coder,1);
for i = 1 : r
    for j = 1 : coder
        S(i+r*(j-1)) = A(i,j);
    end
end
% bubble sort
for i = 1 : r*coder - 1
    for j = 1 : r*coder - i
        if(S(j) > S(j+1))
            temp = S(j);
            S(j) = S(j+1);
            S(j+1) = temp;
        end
    end
end