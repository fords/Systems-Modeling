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

[time_b,H1_b,H2_b,Volt_b]=textread('TT_DynamicValidationData_2_exc.txt');

m1=0.483927243425498;
m2=0.316070247703625;
k1=2.127415329355254e-06;
k2=6.380700168531359e-06;


H1_IC = (2.08E+01)*0.01;
H2_IC = (2.75E+01)*0.01;

endtime = 105.15;

[t,H_ode] = ode45(@(t,y) case3_ode45_val(t,y,K,Volt,AreaTop,g,m1,m2,k1,k2,rho,endtime),time,[H1_IC H2_IC]);

figure(1)
plot(time,H1*0.01,t,H_ode(:,1))
title('Validation 1 H1');

figure(2)
plot(time,H2*0.01,t,H_ode(:,2))
title('Validation 1 H2');

rmsH1_val1 = rms(H_ode(:,1)-H1*0.01);
rmsH2_val1 = rms(H_ode(:,2)-H2*0.01);

% Validation 2


H1_IC = (1.77E+01)*0.01;
H2_IC = (2.41E+01)*0.01;

endtime = 161.6;

[t2,H_ode2] = ode45(@(t2,y) case3_ode45_val(t2,y,K,Volt_b,AreaTop,g,m1,m2,k1,k2,rho,endtime),time_b,[H1_IC H2_IC]);

figure(3)
plot(time_b,H1_b*0.01,t2,H_ode2(:,1))
title('Validation 2 H1');

figure(4)
plot(time_b,H2_b*0.01,t2,H_ode2(:,2))
title('Validation 2 H2');

rmsH1_val2 = rms(H_ode2(:,1)-H1_b*0.01);
rmsH2_val2 = rms(H_ode2(:,2)-H2_b*0.01);
