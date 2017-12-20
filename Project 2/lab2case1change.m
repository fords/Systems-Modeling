num = xlsread('SP_ModelingData_20ms_p45deg.csv');
time =num(11:end,1);
displacement = num(11:end,2);

[pks,locs]=findpeaks(displacement);
plot(time,displacement);hold on;
plot(time(locs),displacement(locs),'k^')
d = (log(displacement(locs(7,1))/displacement(locs(63,1))))/56;
zeta = d/sqrt(4*pi^2+d^2);
period = (time(locs(63,1))-time(locs(7,1)))/56;
w0 = 2*pi/period;
wn = w0/sqrt(1-zeta^2);
x = 9.81/wn^2;
b =2*zeta*wn*.1389*x^2;

[t,theta] = ode45(@(time,y) syst1(time,y,b),x_45deg,[pi/4 0]);
plot(t,theta*180/pi);


% num = xlsread('SP_ModelingData_20ms_p45deg.csv');
% num2 = xlsread('SP_ValidationData_20ms_p30deg.csv');
% num3 = xlsread('SP_ValidationData_20ms_p90deg.csv');
% x_30deg = num(11:end,1);
% y_30deg = num(11:end,2);
% x_45deg = num(11:end,1);
% y_45deg = num(11:end,2);
% x_90deg = num(11:end,1);
% y_90deg = num(11:end,2);
% plot(x_30deg,y_30deg);
% figure(2)
% plot(x_90deg,y_90deg);
% figure(3)
% plot(x_45deg,y_45deg);