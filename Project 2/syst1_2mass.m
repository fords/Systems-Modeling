

b = 0.001:0.002:0.02;
[t,theta] = ode45(@(t,y) syst1mass(t,y,c),x_45deg,[pi/4 0]);
plot(t,theta(:,1)*180/pi);
hold on
plot(x_45deg,y_45deg);



for i=1:length(b)
    
c2=b(i);
[t2,theta2] = ode45(@(t2,y) syst2mass(t2,y,c2),x_45deg,[pi/4 0]);
k(i) = sum((y_45deg - theta2(:,1)*(180/pi)).^2);

end


ts_min = min(k);

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c = damp
[t,theta] = ode45(@(t,y) syst2mass(t,y,c),x_45deg,[pi/4 0]);

