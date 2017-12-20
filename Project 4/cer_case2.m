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

% figure(1)
% plot(time_cool,temp_cer_cool);


b = 15:0.04:35;

% Aw = ((pi/4)*(odcer-2*tcer)^2)*hcer;
% At = ((pi/4)*(odcer)^2)*hcer;
% 
% Cw =(pwat*Aw/2)*Cpwat;
% Cc =(pwat*(Aw-At)*Cpcer/2);
% 
%  Rw = (odcer/2-tcer)/(kwat*hcer*pi*(odcer/2-tcer));
% % Aw = hcer*(odcer/2-tcer);
% % Rw = (odcer/2-tcer)/(kwat*Aw);

Area = pi*(odcer/2-tcer)*hcer
Rcond = (tcer/2)/(kcer*Area);
Rconva = 1/Area;
Volt = (pi*(odcer^2)/4)*hcer/2;
Volwat = (hcer/2)*(pi/4)*(odcer-2*tcer)^2;
Volcer = Volt - Volwat;
Cw = pwat*Cpwat*Volwat;
Cc = pcer*Cpcer*Volcer;

for i=1:length(b)
    
A = [-1/(Rcond*Cw) 1/(Rcond*Cw);1/(Rcond*Cc) (-b(i)/(Rconva*Cc)-1/(Rcond*Cc))];
B = [0; b(i)/(Rconva*Cc)];
C = [1 0];
D = [0];

sys = ss(A,B,C,D);             

[temp] = lsim(sys,temp_amb_cool,time_cool,[80.7 80.7]);

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


A1 = [-1/(Rcond*Cw) 1/(Rcond*Cw);1/(Rcond*Cc) (-h/(Rconva*Cc)-1/(Rcond*Cc))];
B1= [0; h/(Rconva*Cc)];
C1 = [1 0];
D1 = [0];

sys1 = ss(A1,B1,C1,D1);             

temp = lsim(sys1,temp_amb_cool,time_cool,[80.7 80.7]);
RMS_cer_case2_cool = rms(temp_cer_cool-temp)
figure(3)
hold on;
subplot(2,2,2);
plot(time_cool,temp_cer_cool,time_cool,temp);

[time_warm,temp_cer_warm,temp_sty_warm,temp_amb_warm,t_warm]=textread('WarmingData.txt');

temp_warm = lsim(sys1,temp_amb_warm,time_warm,[1.7 1.7]);
RMS_cer_case2_warm = rms(temp_cer_warm-temp_warm)
hold on;
plot(time_warm,temp_cer_warm,time_warm,temp_warm);
grid on;
hold on;

