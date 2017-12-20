function dydt = syst4mass(t,z,c) 

dydt = zeros(size(z));
    
theta = z(1);
dthetadt = z(2);


x = 0.949;

jo = (0.06638 + 0.1389*x^2);

dydt(1) = z(2);
dydt(2) = -(sign(z(2))*c*(z(2)^2))/jo - (1.3626*x+1.04784)*(sin(z(1)))/jo;

end