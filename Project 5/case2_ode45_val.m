function dydt = case2_ode45_val(t,z,K,V,A,g,Cd1,Cd2,endtime,Ao1,Ao2) 

dydt = zeros(size(z));
    
h1 = z(1);
h2 = z(2);
X = .05:.05:endtime;
V_time  =  interp1(X',V,t,'linear');

% dydt(1) =(K*V_time)/A +(-0.0002)/A - (k1*(pho*g*z(1))^m1)/A;
% dydt(2) = (k1*(pho*g*z(1))^m1)/A - (k2*(pho*g*z(2))^m2)/A;

dydt(1) =(K*V_time)/A +(-0.0002)/A - (Cd1*Ao1*((2*g)*z(1))^0.5)/A;
dydt(2) = (Cd1*Ao1*((2*g)*z(1))^0.5)/A - (Cd2*Ao2*((2*g)*z(2))^0.5)/A;

end