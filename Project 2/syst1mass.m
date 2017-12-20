function dydt = syst1mass(t,z,c) 

dydt = zeros(size(z));
    
theta = z(1);
dthetadt = z(2);


x = 0.949;

jo = (0.0660108 + 0.1389*x^2);

dydt(1) = z(2);
dydt(2) = (-c/jo)*z(2) - (1.3626*x+1.04784)*(z(1))/jo;

end
