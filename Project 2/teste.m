
figure(1)
plot(x_30deg,y_30deg);
figure(2)
plot(x_90deg,y_90deg);
figure(3)
plot(x_45deg,y_45deg);

b = 0.001:0.002:0.02;

%part 2 - rod massless

for i=1:length(b)
    
c=b(i);
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_45deg,[pi/4 0]);
k(i) = sum(y_45deg - theta(:,1)*(180/pi)).^2;

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
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_45deg,[pi/4 0]);


figure(5)
plot(t,theta(:,1)*(180/pi));
hold on
plot(x_45deg,y_45deg);
figure(6)
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_30deg,[pi/6 0]);
plot(t,theta(:,1)*(180/pi));
hold on; plot(x_30deg,y_30deg);

figure(7)
[t,theta] = ode45(@(t,y) syst2(t,y,c),x_90deg,[pi/2 0]);
plot(t,theta(:,1)*(180/pi));
hold on; plot(x_90deg,y_90deg);



