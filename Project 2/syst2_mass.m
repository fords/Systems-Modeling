
num = xlsread('SP_ModelingData_20ms_p45deg.csv');

time =num(611:end,1);
displacement = num(611:end,2);



for i=1:length(b)
    
c2=b(i);
[t2,theta2] = ode45(@(t2,y) syst2mass(t2,y,c2),time,[-pi/4 0]);
k(i) = sum(displacement - theta2(:,1)*(180/pi)).^2;

end


ts_min = min(k);

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c = damp;
[t,theta] = ode45(@(t,y) syst2mass(t,y,c),time,[-pi/4 0]);

plot(t,theta(:,1)*(180/pi));
hold on
plot(time,displacement);


figure(2)
time = x_30deg(362:end,1);
displacement = y_30deg(362:end,1);
[t,theta] = ode45(@(time,y) syst2mass(time,y,c),time,[pi/6 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);


figure(3)
time = x_90deg(355:end,1);
displacement = y_90deg(355:end,1);
[t,theta] = ode45(@(time,y) syst2mass(time,y,c),time,[pi/2 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);
