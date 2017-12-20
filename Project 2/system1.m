
function dydt = system1(t,z) 

dydt = zeros(size(z));
    
x1 = z(1);
dx1dt = z(2);
x2 = z(3);
dx2dt = z(4);

[m1,m2,k1,k2,c1,c2,u] = myfun(0)

dydt(1) = z(2);
dydt(2) = (k2/m1)*z(3)-((k2+k1)/m1)*z(1)+(c2/m1)*z(4)-((c2+c1)/m1)*z(2);
dydt(3) = z(4);
dydt(4) = u/m2 - (k2/m2)*(z(3)-z(1))-(c2/m2)*(z(4)-z(2));
end
