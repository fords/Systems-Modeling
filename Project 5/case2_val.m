clear ;
close all;

% Top tank

K = 3*10^-5;
AreaTop = (pi*(0.08)^2)/4;
dTop = 0.295*0.0254;
AdTop = (pi*(0.295*0.0254)^2)/4;

% Bottom tank
AreaBottom = (pi*(0.08)^2)/4;
dBottom = 0.01;
AdBottom = (pi*(0.01)^2)/4;
rho = 1000;
g = 9.81;

[time,H1,H2,Volt]=textread('TT_DynamicValidationData_1_exc.txt');

% Volt_top= [];
% Volt_top(:,1)= time;
% Volt_top(:,2)= Volt*K;
% 

endtime = 105.15;

H1_IC = (2.08E+01)*0.01;
H2_IC = (2.75E+01)*0.01;

[time_b,H1_b,H2_b,Volt_b]=textread('TT_DynamicValidationData_2_exc.txt');


Cd1 = 0.96;
Cd2 = 0.45;

[t,H_ode] = ode45(@(t,y) case2_ode45_val(t,y,K,Volt,AreaTop,g,Cd1,Cd2,endtime,AdTop,AdBottom),time,[H1_IC H2_IC]);

% SimOut = sim('case2_both');


 figure(4)
 plot(time,H_ode(:,1),time,H1*0.01);

figure(5)
plot(time,H_ode(:,2),time,H2*0.01);


rmsH1_val1 = rms(H_ode(:,1)-H1*0.01);
rmsH2_val1 = rms(H_ode(:,2)-H2*0.01);

% validation 2
% 
% clearvars Volt_top
% 
% Volt_top= [];
% Volt_top(:,1)= time_b;
% Volt_top(:,2)= Volt_b*K;


H1_IC = (1.77E+01)*0.01;
H2_IC = (2.41E+01)*0.01;

endtime = 161.6;

[t,H_ode2] = ode45(@(t,y) case2_ode45_val(t,y,K,Volt_b,AreaTop,g,Cd1,Cd2,endtime,AdTop,AdBottom),time_b,[H1_IC H2_IC]);


 figure(6)
 plot(time_b,H_ode2(:,1),time_b,H1_b*0.01);

figure(7)
plot(time_b,H_ode2(:,2),time_b,H2_b*0.01);


rmsH1_val2 = rms(H_ode2(:,1)-H1_b*0.01);
rmsH2_val2 = rms(H_ode2(:,2)-H2_b*0.01);



% SimOut = sim('case2_both');
% 
%  figure(6)
%  plot(time_simu,H1_simu_b,time_b,H1_b*0.01);
% 
% figure(7)
% plot(time_simu,H2_simu_b,time_b,H2_b*0.01);
% 
% 
