function s_minimal = MIN(A)
[r,coder] = size(A);
s_minimal = A(1,1);
for i = 1 : r
    for j = 1 : coder
        if s_minimal > A(i,j)
            s_minimal = A(i,j);
        end
    end
end
