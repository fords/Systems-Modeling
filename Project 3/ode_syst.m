function dydt = ode_syst(t,z,c,J,Va) 

dydt = zeros(size(z));


current = z(1);
w = z(2);

Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59; 
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;



for i=1:471
   
    if Va(i,1) == t
        Vol = Va(i,2);
    end
end


dydt(1) = (Vol - Ra*z(1) - Ke*z(2))/La;
dydt(2) = (Kt*z(1) - (c+D)*z(2))/(J+Jm);

end
