function dydt = systemnon(t,z) 

dydt = zeros(size(z));
    
tetha = z(1);
dtethadt = z(2);
% x2 = z(3);
% dx2dt = z(4);

[m1,m2,k1,k2,c1,c2,u] = myfunnon(1)

dydt(1) = z(2);
dydt(2) = (-b/m*x^2)*z(2) - (g/x)*sin(z(1));

end
