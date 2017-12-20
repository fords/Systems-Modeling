 clear;
 close all;

pwat = 1000;
pcer = 2400;
psty = 100;
kwat = 0.609;
kcer = 1.5;
ksty = 0.033;
Cpwat = 4187;
Cpcer = 1070;
Cpsty = 1300;
hcer = 0.12;
odcer = 0.085;
tcer = 0.004;
hsty = 0.12;
odsty = 0.0765;
tsty = 0.003;

[time_cool,temp_cer_cool,temp_sty_cool,temp_amb_cool,t]=textread('CoolingData.txt');

% figure(1)
% plot(time_cool,temp_cer_cool);

volcer = (pi*odcer*odcer/4)*hcer;

b = 10:0.04:20;

for i=1:length(b)
    
A = [-(b(i)*pi*odcer*hcer)/(pwat*volcer*Cpwat)];
B = [(b(i)*pi*odcer*hcer)/(pwat*volcer*Cpwat)];
C = [1];
D = [0];

sys = ss(A,B,C,D);             

temp = lsim(sys,temp_amb_cool,time_cool,80.7);

k(i) = sum((temp - temp_cer_cool).^2);


end

figure(2)
plot(b,k);


ts_min = min(k);
 
for i=1:length(b)
   
    if k(i)== ts_min
     h = b(i);
    end 
end

A1 = [-(h*pi*odcer*hcer)/(pcer*volcer*Cpcer)];
B1 = [(h*pi*odcer*hcer)/(pcer*volcer*Cpcer)];
C1 = [1];
D1 = [0];

sys1 = ss(A1,B1,C1,D1);             

temp = lsim(sys1,temp_amb_cool,time_cool,80.7);
RMS_cer_case1_cool = rms(temp_cer_cool-temp)
figure(3)
subplot(2,2,1);
plot(time_cool,temp_cer_cool,time_cool,temp);

[time_warm,temp_cer_warm,temp_sty_warm,temp_amb_warm,t_warm]=textread('WarmingData.txt');


% figure(4)
% plot(time_warm,temp_cer_warm);

temp_warm = lsim(sys1,temp_amb_warm,time_warm,1.7);
RMS_cer_case1_warm = rms(temp_cer_warm-temp_warm)
hold on
plot(time_warm,temp_cer_warm,time_warm,temp_warm);
title(' Ceramic Case 1 warming and cooling')
legend('real cooling temp','simulated cooling temp','real warming temp' ,'simulated warming temp');
xlabel(' Time (Secs)');
ylabel(' Temp (Celsius)');
grid on;hold on;
