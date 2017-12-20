clear; close all;


%  a = 0:1e-4:1e-3;
%  b = 0:3e-4:1e-2;


Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59; 
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;

 w_L=[];w_L(1,1)=0;
% global time_L voltage_L current_L angle_L Va_load;

[time_L,voltage_L,current_L,angle_L]=textread('DCM_Loaded_ModelingData_1_4v.txt');

Va_load= [];
Va_load(:,1)= time_L;
Va_load(:,2)= voltage_L;


for i=1:470
    w_L(i+1,1)= (angle_L(i+1)-angle_L(i,1))/.02;
end


 [x] = fminsearch(@(x) fmin2(x,voltage_L,w_L,time_L,current_L),[0.0001 0.0001]);

 
%  J = x(1,1);
%  c = x(1,2);
%  
% a = [-Ra/La -Ke/La;Kt/(J+ Jm) -(c+D)/(J + Jm)];
% b = [1/La; 0];
% e = [1 0];
% d = [0];
% 
% sys = ss(a,b,e,d);
% [y,t,z] = lsim(sys,voltage_L,time_L);
%  
% e = [0 1];
% 
% sys = ss(a,b,e,d);
% [y1,t,z] = lsim(sys,voltage_L,time_L);
%  

% figure(9)
% plot(t,y);
% % hold on
% % plot(time_L,current_L);
% 
% figure(10)
% plot(t,y1);
% hold on
% plot(time_L,w_L*pi/180);



[y] = fminsearch(@(y) fmin2_speed(y,voltage_L,w_L,time_L,current_L),[0.0001 0.0001]);



