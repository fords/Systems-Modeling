% clear all;
% close all;

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


b = 5:0.04:30;

Area = pi*odcer*hcer/2;

Volt = (pi*(odcer^2)/4)*hcer/2;
Volwat = (hcer/2)*(pi/4)*(odcer-2*tcer)^2;

Volc = (Volt - Volwat)/2;

% Volc = (hcer/2)*(pi/4)*(odcer-tcer)^2;
% Volcer1 = Volt - Volc;  
% Volcer2 = Volt - Volc - Volwat;


Rcond1 = (tcer/2)/(kcer*Area);
Rcond2 = (tcer/2)/(kcer*Area);
Rconva = 1/Area;

Cw = pwat*Cpwat*Volwat;
Cc1 = pcer*Cpcer*Volc;
Cc2 = pcer*Cpcer*Volc;


for i=1:length(b)
    
A = [-1/(Rcond2*Cw) 0 1/(Rcond2*Cw);
     0 (-b(i)/(Rconva*Cc1)-1/(Rcond1*Cc1)) 1/(Rcond1*Cc1);
     1/(Cc2*Rcond2) 1/(Cc2*Rcond1) -1/(Rcond1*Cc2)-1/(Rcond2*Cc2)];
B = [0; b(i)/(Rconva*Cc1); 0];
C = [1 0 0];
D = [0];

sys = ss(A,B,C,D);             

[temp] = lsim(sys,temp_amb_cool,time_cool,[80.7 80.7 80.7]);

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


A1 = [-1/(Rcond2*Cw) 0 1/(Rcond2*Cw);
     0 (-h/(Rconva*Cc1)-1/(Rcond1*Cc1)) 1/(Rcond1*Cc1);
     1/(Cc2*Rcond2) 1/(Cc2*Rcond1) -1/(Rcond1*Cc2)-1/(Rcond2*Cc2)];
B1 = [0; h/(Rconva*Cc1); 0];
C1 = [1 0 0];
D1 = [0];

sys1 = ss(A1,B1,C1,D1);             

temp = lsim(sys1,temp_amb_cool,time_cool,[80.7 80.7 80.7]);
RMS_cer_case4_cool = rms(temp_cer_cool-temp)

figure(3)
subplot(2,2,4);
plot(time_cool,temp_cer_cool,time_cool,temp);

[time_warm,temp_cer_warm,temp_sty_warm,temp_amb_warm,t_warm]=textread('WarmingData.txt');

temp_warm = lsim(sys1,temp_amb_warm,time_warm,[1.7 1.7 1.7]);
RMS_cer_case4_warm = rms(temp_cer_warm-temp_warm);
hold on;
plot(time_warm,temp_cer_warm,time_warm,temp_warm);
grid on;
hold on;
