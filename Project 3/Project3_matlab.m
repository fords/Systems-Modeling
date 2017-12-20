
%plotyy(Time,MotCur_A,Time,Motor_RPM)

% No Load - Model data set
Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59;
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;


w=[];w(1,1)=0;
[time1,voltage,current,angle]=textread('DCM_NoLoad_ModelingData_1_2v.txt');

Va= [];
Va(:,1)= time1;
Va(:,2)= voltage;


for i=1:329
    w(i+1,1)= (angle(i+1)-angle(i,1))/.02;
end

SimOut = sim('Second_disconnected');

figure(1)
plot(time,Current_a_disconnected);
hold on
plot(time1,current);

figure(2)
plot(time,Theta_disconnected);
hold on
plot(time1,w*pi/180);

w*pi/180;
Theta_disconnected


%//////// No load - Validation data set


w_val=[];w_val(1,1)=0;
[time_val_NL,voltage_val_NL,current_val_NL,angle_val_NL]=textread('DCM_NoLoad_ValidationData_Steps3.txt');

Va_val_NL= [];
Va_val_NL(:,1)= time_val_NL;
Va_val_NL(:,2)= voltage_val_NL;


for i=1:511
    w_val(i+1,1)= (angle_val_NL(i+1)-angle_val_NL(i,1))/.02;
end

SimOut = sim('Second_disconnected_val');

figure(3)
plot(time_val,Current_a_disconnected_val);
hold on
plot(time_val_NL,current_val_NL);

figure(4)
plot(time_val,Theta_disconnected_val);
hold on
plot(time_val_NL,w_val*pi/180);





