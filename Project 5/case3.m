clear;
close all;

pho = 1000;
g = 9.81;
% Top tank

K = 8*10^-5;
AreaTop = (pi*(0.08)^2)/4;
dTop = 0.295*0.0254;
AdTop = (pi*(0.295*0.0254)^2)/4;

% Bottom tank
AreaBottom = (pi*(0.08)^2)/4;
dBottom = 0.01;
AdBottom = (pi*(0.01)^2)/4;

Ic = (3.59E+01)*0.01;

[time,H1,H2,Volt]=textread('TT_TopTankDrain_0.295in_3_exc.txt');
H1 = H1(472:size(H1),1)*0.01;
time = 0:0.05:31.7;



[x] = fminsearch(@(x) fmin_tank(x,AreaTop,g,pho,time,H1,Ic),[0.01 0.01]);

[t,H1_ode] = ode45(@(t,y) case3_ode45(t,y,AreaTop,g,x(1),x(2),pho),time,[Ic]);

figure(1)
plot(t,H1_ode,time,H1);

rms_case3_H1 = rms(H1_ode-H1);

% bottom tank

[time_b,H1_b,H2_b,Volt_b]=textread('TT_BottomTankDrain_10mm_4_exc.txt');
H2_b = H2_b(997:size(H2_b),1)*0.01;

Ic = (3.98E+01)*0.01;
time1 = 0:0.05:40.65;
[z] = fminsearch(@(z) fmin_tank(z,AreaBottom,g,pho,time1,H2_b,Ic),[0.01 0.01]);

[t,H2_ode] = ode45(@(t,y) case3_ode45(t,y,AreaBottom,g,z(1),z(2),pho),time1,[Ic]);

figure(2)
plot(t,H2_ode,time1,H2_b);

rms_case3_H2 = rms(H2_ode-H2_b);