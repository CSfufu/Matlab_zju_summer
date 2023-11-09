function s_maximal = MAX(A)
s_maximal = A(1,1);
[r,coder] = size(A);
for i = 1 : r
    for j =1 : coder
        if s_maximal < A(i,j)
            s_maximal = A(i,j);
        end
    end
end