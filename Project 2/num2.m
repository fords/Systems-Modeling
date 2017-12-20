
% figure(1)
% plot(x_30deg,y_30deg);
% figure(2)
% plot(x_90deg,y_90deg);
% figure(3)
% plot(x_45deg,y_45deg);

b = 0.002:0.0008:0.04;
time =x_45deg(611:end,1);
displacement = y_45deg(611:end,1);
%part 2 - rod massless

for i=1:length(b)
    
c=b(i);
[t,theta] = ode45(@(t,y) syst2(t,y,c),time,[-pi/4 0]);
k(i) = sum(displacement - theta(:,1)*(180/pi)).^2;

end
figure(4)
plot(b,k)

ts_min = min(k)

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c = damp;
[t,theta] = ode45(@(t,y) syst2(t,y,c),time,[-pi/4 0]);
figure(1)
plot(t,theta(:,1)*(180/pi));
hold on
plot(time,displacement);

 figure(2)
 time = x_30deg(362:end,1);
 displacement = y_30deg(362:end,1);
 [t,theta] = ode45(@(t,y) syst2(t,y,c),time,[pi/6 0]);
 plot(t,theta(:,1)*180/pi);
 hold on;
 plot(time,displacement);


figure(3)
time = x_90deg(355:end,1);
displacement = y_90deg(355:end,1);
[t,theta] = ode45(@(t,y) syst2(t,y,c),time,[pi/2 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);


