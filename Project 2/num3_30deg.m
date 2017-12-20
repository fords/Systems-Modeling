
for i=1:length(b)
    
c2=b(i);
[t2,theta2] = ode45(@(t2,y) syst3(t2,y,c2),x_30deg,[pi/6 0]);
k(i) = sum(y_30deg - theta2(:,1)*(180/pi)).^2;

end

figure(6)
plot(b,k)

ts_min = min(k);

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c2 = damp;
[t,theta] = ode45(@(t,y) syst3(t,y,c2),x_30deg,[pi/6 0]);


figure(7)
plot(t,theta(:,1)*(180/pi));
hold on
plot(x_30deg,y_30deg);
