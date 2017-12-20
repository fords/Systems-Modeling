function dydt = case2_ode45(t,z,Ao1,Cd1,A,g) 

dydt = zeros(size(z));
    
h1 = z(1);


dydt(1) =- (Cd1*Ao1*(2*g)*z(1)^0.5)/A;

end
