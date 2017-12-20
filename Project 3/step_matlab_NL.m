clear; close all;
[time_L,voltage_L,current_L,angle_L]=textread('DCM_NoLoad_ModelingData_1_2v.txt');

%  figure(1)
%  plot(time_L,voltage_L);

 
Va= [];
Va(:,1)= time_L;
Va(:,2)= voltage_L;

w_L=[];w_val_L(1,1)=0;


for i=1:329
    w_L(i+1,1)= (angle_L(i+1)-angle_L(i,1))/.02;
end


% figure(3)
% plot(time_L,w_L*pi/180);


SimOut = sim('step_simulink_NL');

figure(2)
plot(time,Out,time_L,w_L*pi/180);