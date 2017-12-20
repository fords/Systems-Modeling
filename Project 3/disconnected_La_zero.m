La = 0;


w=[];w(1,1)=0;
[time_nl,voltage_nl,current_nl,angle_nl]=textread('DCM_NoLoad_ModelingData_1_2v.txt');

Va= [];
Va(:,1)= time_nl;
Va(:,2)= voltage_nl;


for i=1:329
    w(i+1,1)= (angle_nl(i+1)-angle_nl(i,1))/.02;
end

SimOut = sim('Second_disconnected');

figure(5)
plot(time,Current_a_disconnected);
hold on
plot(time_nl,current_nl);

figure(6)
plot(time,Theta_disconnected);
hold on
plot(time_nl,w*pi/180);



%Validation data set
La = 0;

w_val=[];w_val(1,1)=0;
[time_val_NL,voltage_val_NL,current_val_NL,angle_val_NL]=textread('DCM_NoLoad_ValidationData_Steps3.txt');

Va_val_NL= [];
Va_val_NL(:,1)= time_val_NL;
Va_val_NL(:,2)= voltage_val_NL;



for i=1:511
    w_val(i+1,1)= (angle_val_NL(i+1)-angle_val_NL(i,1))/.02;
end

SimOut = sim('Second_disconnected_val');

figure(7)
plot(time_val,Current_a_disconnected_val);
hold on
plot(time_val_NL,current_val_NL);

figure(8)
plot(time_val,Theta_disconnected_val);
hold on
plot(time_val_NL,w_val*pi/180);
