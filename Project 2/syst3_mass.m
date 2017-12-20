
num = xlsread('SP_ModelingData_20ms_p45deg.csv');

time =num(611:end,1);
time = time-time(1)
% time =time(1:4953,1);
displacement = num(611:end,2);
% displacement = displacement(1:4953,1);
b=0.001:.0005:.02;

for i=1:length(b)
    
c2=b(i);
[t2,theta2] = ode45(@(t2,y) syst3mass(t2,y,c2),time,[pi/4 0]);
k2(i) = sum(displacement - theta2(:,1)*(180/pi)).^2;
% SimOut = sim('case123_simulink');
% k2(i) = sum(displacement - Theta_case3*(180/pi)).^2;
end
figure(4)
plot(b,k2)

ts_min = min(k2);

for i=1:length(b)

    if k2(i)== ts_min
    damp = b(i);    
    end
    
end
    
figure (5)
c = damp;
[t,theta] = ode45(@(t,y) syst3mass(t,y,c),time,[pi/4 0]);
figure(1)
plot(t,theta(:,1)*(180/pi));
% plot(time,SimOut*(180/pi))
hold on
plot(time,displacement);
% c2 = c;
% SimOut = sim('case123_simulink');
% plot(time,Theta_case3*180/pi);
% hold on
% plot(time,displacement);




% figure(2)
% time2 = x_30deg(362:end,1);
% displacement = y_30deg(362:end,1);
% init = pi/6;
% b = c;
% % SimOut = sim('case123_30dsimulink');
% % plot(time2,Theta_case3_30d*180/pi);
% hold on
% plot(time2,displacement);
% 
% 
% figure(3)
% time3 = x_90deg(355:end,1);
% displacement = y_90deg(355:end,1);
% init = pi/2;
% b = c;
% SimOut = sim('case123_90dsimulink');
% plot(time3,Theta_case3_90d*180/pi);
% hold on;
% plot(time3,displacement);
figure(2)
time = x_30deg(233:end,1);
time = time-time(1);
displacement = y_30deg(233:end,1);
[t,theta] = ode45(@(time,y) syst3mass(time,y,c),time,[pi/6 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);


figure(3)
time = x_90deg(355:end,1);
time = time-time(1);
displacement = y_90deg(355:end,1);
[t,theta] = ode45(@(time,y) syst3mass(time,y,c),time,[pi/2 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);


