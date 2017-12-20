function dydt = case3_ode45(t,z,A,g,m1,k1,pho) 

dydt = zeros(size(z));
    
h1 = z(1);

dydt(1) = - (k1*(pho*g*z(1))^m1)/A;


end
