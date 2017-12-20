clear all;
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

volsty = (pi*odsty*odsty/4)*hsty;

b = 4:0.04:20;

for i=1:length(b)
    
A = [-(b(i)*pi*odsty*hsty)/(pwat*volsty*Cpwat)];
B = [(b(i)*pi*odsty*hsty)/(pwat*volsty*Cpwat)];
C = [1];
D = [0];

sys = ss(A,B,C,D);             

temp = lsim(sys,temp_amb_cool,time_cool,80.7);

k(i) = sum((temp - temp_sty_cool).^2);


end

figure(2)
plot(b,k);


ts_min = min(k);
 
for i=1:length(b)
   
    if k(i)== ts_min
     h = b(i);
    end 
end


A1 = [(-h*pi*odsty*hsty)/(pwat*volsty*Cpwat)];
B1 = [(h*pi*odsty*hsty)/(pwat*volsty*Cpwat)];
C1 = [1];
D1 = [0];

sys1 = ss(A1,B1,C1,D1);             

temp = lsim(sys1,temp_amb_cool,time_cool,80.7);

figure(3)
plot(time_cool,temp_sty_cool,time_cool,temp);

[time_warm,temp_cer_warm,temp_sty_warm,temp_amb_warm,t_warm]=textread('WarmingData.txt');

% figure(4)
% plot(time_warm,temp_cer_warm);


temp_warm = lsim(sys1,temp_amb_warm,time_warm,1.7);

figure(5)
plot(time_warm,temp_sty_warm,time_warm,temp_warm);

