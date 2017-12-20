

for i=1:length(b)
    
c=b(i);
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_90deg,[pi/2 0]);
k(i) = sum(y_90deg - theta(:,1)*(180/pi)).^2;

end
figure(4)
plot(b,k)

ts_min = min(k);

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c = damp;
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_90deg,[pi/2 0]);


figure(5)
plot(t,theta(:,1)*(180/pi));
hold on
plot(x_90deg,y_90deg);

