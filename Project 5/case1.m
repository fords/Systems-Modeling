clear all;
close all;

% Top tank

AreaTop = (pi*(0.08)^2)/4;
dTop = 0.295*0.0254;
AdTop = (pi*(0.295*0.0254)^2)/4;

% Bottom tank
AreaBottom = (pi*(0.08)^2)/4;
dBottom = 0.01;
AdBottom = (pi*(0.01)^2)/4;
rho = 1000;
g = 9.81;

[time,H1,H2,Volt]=textread('TT_TopTankDrain_0.295in_3_exc.txt');
H1 = H1(472:size(H1),1)*0.01;

[time_b,H1_b,H2_b,Volt_b]=textread('TT_BottomTankDrain_10mm_4_exc.txt');
H2_b = H2_b(997:size(H2_b),1)*0.01;

% 
% figure(1)
% plot(time,H1,time,H2,time,Volt);
% figure(2)
% plot(time_b,H1_b,time_b,H2_b,time_b,Volt_b);


%Not sure how to find R1 and R2
R1 = 12.88*10^6;
R2 = 16.5889*10^6;

% A = [-rho*g/(R1*AreaTop) 0;rho*g/(R1*AreaBottom) -rho*g/(R2*AreaBottom)];
% B = [K/AreaTop; 0];
% C = [1 0;0 1];
% D = [0;0];
% 
% sys = ss(A,B,C,D);             
% 
% [H1_1,H2_1] = lsim(sys,Volt,time,[0 0]);
%

A = [-rho*g/(R1*AreaTop)];
B = [0];
C = [1];
D = [0];

sys = ss(A,B,C,D);             

time = 0:0.05:31.7;
Ic = (3.59E+01)*0.01;
[H1_1] = initial(sys,Ic,time);


figure(3)
plot(time,H1_1,time,H1);

rms_case1_h1 = rms(H1_1-H1);


A = [-rho*g/(R2*AreaBottom)];
B = [0];
C = [1];
D = [0];

sys2 = ss(A,B,C,D);             

time1 = 0:0.05:40.65;
Ic = (3.98E+01)*0.01;
[H2_1] = initial(sys2,Ic,time1);


figure(2)
plot(time1,H2_1,time1,H2_b);

rms_case1_h2 = rms(H2_1-H2_b);