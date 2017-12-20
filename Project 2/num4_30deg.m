
for i=1:length(b)
    
c=b(i);
[t,theta] = ode45(@(t,y) syst4(t,y,c),x_45deg,[pi/4 0]);
k(i) = sum(y_45deg - theta(:,1)*(180/pi)).^2;

end