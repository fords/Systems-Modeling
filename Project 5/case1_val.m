clear ;
close all;

% Top tank

K = 3*10^-5;
Kb = -0.0002;
AreaTop = (pi*(0.08)^2)/4;
dTop = 0.295*0.0254;
AdTop = (pi*(0.295*0.0254)^2)/4;

% Bottom tank
AreaBottom = (pi*(0.08)^2)/4;
dBottom = 0.01;
AdBottom = (pi*(0.01)^2)/4;
rho = 1000;
g = 9.81;

R1 = 12.88*10^6;
R2 = 16.5889*10^6;

[time,H1,H2,Volt]=textread('TT_DynamicValidationData_1_exc.txt');



[time_b,H1_b,H2_b,Volt_b]=textread('TT_DynamicValidationData_2_exc.txt');


A = [-rho*g/(R1*AreaTop) 0;rho*g/(R1*AreaBottom) -rho*g/(R2*AreaBottom)];
B = [K/AreaTop Kb/AreaTop;0 0];
C = [1 0;0 1];
D = [0 0;0 0];

sys = ss(A,B,C,D);             


u = ones(size(Volt));

[H] = lsim(sys,[Volt u],time,[(2.08E+01)*0.01 (2.75E+01)*0.01]);


figure(4)
plot(time,H(:,1),time,H1*0.01);

figure(5)
plot(time,H(:,2),time,H2*0.01);

rmsH1_val1 = rms(H(:,1)-H1*0.01);
rmsH2_val1 = rms(H(:,2)-H2*0.01);


% validation data 2

u = ones(size(Volt_b));

[H_b] = lsim(sys,[Volt_b u],time_b,[(1.77E+01)*0.01 (2.41E+01)*0.01]);


figure(6)
plot(time_b,H_b(:,1),time_b,H1_b*0.01);


figure(7)
plot(time_b,H_b(:,2),time_b,H2_b*0.01);


rmsH1_val2 = rms(H_b(:,1)-H1_b*0.01);
rmsH2_val2 = rms(H_b(:,2)-H2_b*0.01);
