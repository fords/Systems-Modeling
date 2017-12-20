b = 0.001:0.002:0.04

y_45deg_cut = y_45deg(1:1000,1);
for j=1:length(b)
 for i=1:length(b)
    
kg=b(i);
ko=b(j);
[t,theta] = ode45(@(t,y) syst4(t,y,kg,ko),x_45deg(1:1000,1),[pi/4 0]);
k(i,j) = sum(y_45deg_cut - theta(:,1)*(180/pi)).^2;

 end

end

