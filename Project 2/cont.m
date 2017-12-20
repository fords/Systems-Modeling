% contour3(k);
% 
 [M,I] = min(k(:))
% 
% 
% [I_row,I_col]= ind2sub(size(k),I)

b = 0.001:0.002:0.04;

for i = 1:length(b)
    for j = 1:length(b)
        
        if k(i,j) == M
            kg = b(j)
            ko = b(i)
            
        end
    end
end

