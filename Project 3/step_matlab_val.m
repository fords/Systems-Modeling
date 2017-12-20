clear; close all;
[time_L,voltage_L,current_L,angle_L]=textread('DCM_Loaded_ValidationData_Steps3.txt');

% figure(1)
% plot(time_L,voltage_L);

Va= [];
Va(:,1)= time_L;
Va(:,2)= voltage_L;

w_L=[];w_val_L(1,1)=0;

for i=1:511
    w_L(i+1,1)= (angle_L(i+1)-angle_L(i,1))/.02;
end

SimOut = sim('step_simulink_Val');

figure(2)
plot(time,Out,time_L,w_L*pi/180);