function dydt = syst4(t,z,kg,ko) 

dydt = zeros(size(z));
    
theta = z(1);
dthetadt = z(2);


x = 0.8;
m=0.1389;

dydt(1) = z(2);
dydt(2) = -(sign(z(2))*(kg*abs(z(2))+ko))/(m*x^2) - (9.81/x)*sin(z(1));

end
