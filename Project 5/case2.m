clear all;
close all;

 
g = 9.81;
% Top tank


AreaTop = (pi*(0.08)^2)/4;
dTop = 0.295*0.0254;
AdTop = (pi*(0.295*0.0254)^2)/4;

% Bottom tank
AreaBottom = (pi*(0.08)^2)/4;
dBottom = 0.01;
AdBottom = (pi*(0.01)^2)/4;


[time,H1,H2,Volt]=textread('TT_TopTankDrain_0.295in_3_exc.txt');
H1 = H1(472:size(H1),1);
time = 0:0.05:31.7; 
% Volt_top= [];
% Volt_top(:,1)= time(82:size(time),1);
% Volt_top(:,2)= Volt(82:size(Volt),1);

[time_b,H1_b,H2_b,Volt_b]=textread('TT_BottomTankDrain_10mm_4_exc.txt');
H2_b = H2_b(997:size(H2_b),1);

b1 = 0:0.01:2;

H1_IC = (3.59E+01)*0.01;

for i=1:length(b1)

  Cd1 = b1(i);
 SimOut = sim('case2_toptank');

%[t,H_ode] = ode45(@(t,y) case2_ode45(t,y,AdTop,Cd1,AreaTop,g),time,[H1_IC]);


%k(i) = sum((H1*0.01 -H_ode).^2);

k(i) = sum((H1*0.01 -H1_simu).^2);
 
end


figure(20)
plot(b1,k);
title('cost function for second order');
 
ts_min = min(k);
 
for i=1:length(b1)
 
    if k(i)== ts_min
    Cd1 = b1(i);
    end
    
end


SimOut = sim('case2_toptank');

figure(1)
plot(time_top,H1*0.01,time_top,H1_simu);

rms_case2_H1 = rms(H1*0.01-H1_simu);


b2 = 0:0.01:2;

for i=1:length(b2)

  Cd2 = b2(i);
 
SimOut = sim('case2_bottomtank');
  
 

k2(i) = sum((H2_b*0.01 -H2_simu).^2);
 
end


figure(3)
plot(b2,k2);
title('cost function for second order');
 
ts_min = min(k2);
 
for i=1:length(b2)
 
    if k2(i)== ts_min
    Cd2 = b2(i);
    end
    
end

SimOut = sim('case2_bottomtank');

figure(2)
plot(time_bottom,H2_b*0.01,time_bottom,H2_simu);
rms_case2_H2 = rms(H2_b*0.01-H2_simu);

%
% figure(6)
% plot(time_simu(1:1106),H1_simu_b(1:1106),time,H1)


% figure(7)
% plot(time_simu,H2_simu_b,time_b,H2_b)
