num = xlsread('SP_ModelingData_20ms_p45deg.csv');

time =num(611:end,1);
displacement = num(611:end,2);



x = 0.949;
jo = (0.06638 + 0.1389*x^2);
c1= 2*zeta*wn*jo;
[t,theta] = ode45(@(t,y) syst1mass(t,y,c1),time,[-pi/4 0]);
plot(t,theta(:,1)*180/pi);
hold on
plot(time,displacement);

figure(2)
time = x_30deg(233:end,1);
displacement = y_30deg(233:end,1);
[t,theta] = ode45(@(time,y) syst1mass(time,y,c1),time,[pi/6 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);


figure(3)
time = x_90deg(355:end,1);
displacement = y_90deg(355:end,1);
[t,theta] = ode45(@(time,y) syst1mass(time,y,c1),time,[pi/2 0]);
plot(t,theta(:,1)*180/pi);
hold on;
plot(time,displacement);

% 