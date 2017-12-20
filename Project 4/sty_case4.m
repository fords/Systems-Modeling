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


b = 10:0.01:25;

Area = pi*odsty*hsty/2;

Volt = (pi*(odsty^2)/4)*hsty/2;
Volwat = (hsty/2)*(pi/4)*(odsty-2*tsty)^2;
Volsty = Volt - Volwat;

twat = ((pi/4)*(odsty-2*tsty)^2)*(hsty/2)/(pi*odsty*hsty/2);

Rcond = (tsty/9)/(ksty*Area);
Rconva = 1/Area;
Cw = pwat*Cpwat*Volwat;
Ccn = psty*Cpsty*Volsty/9;
 

for i=1:length(b)
    
A = [-1/(Cw*Rcond) 0 0 0 0 0 0 0 0 1/(Cw*Rcond);
    0 (-b(i)/(Rconva*Ccn)-1/(Rcond*Ccn)) 1/(Rcond*Ccn) 0 0 0 0 0 0 0;
    0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0 0 0;
    0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0 0;
    0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0;
    0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0;
    0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0;
    0 0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0;
    0 0 0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn);
    1/(Rcond*Ccn) 0 0 0 0 0 0 0 1/(Rcond*Ccn) -1/(Rcond*Ccn)-1/(Rcond*Ccn)];
B = [0; b(i)/(Rconva*Ccn); 0; 0; 0; 0; 0; 0; 0; 0];
C = [1 0 0 0 0 0 0 0 0 0];
D = [0];

sys = ss(A,B,C,D);             

[temp] = lsim(sys,temp_amb_cool,time_cool,[80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7]);

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


A1 = [-1/(Cw*Rcond) 0 0 0 0 0 0 0 0 1/(Cw*Rcond);
    0 (-h/(Rconva*Ccn)-1/(Rcond*Ccn)) 1/(Rcond*Ccn) 0 0 0 0 0 0 0;
    0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0 0 0;
    0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0 0;
    0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0 0;
    0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0 0;
    0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0 0;
    0 0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn) 0;
    0 0 0 0 0 0 0 1/(Rcond*Ccn) -2/(Rcond*Ccn) 1/(Rcond*Ccn);
    1/(Rcond*Ccn) 0 0 0 0 0 0 0 1/(Rcond*Ccn) -1/(Rcond*Ccn)-1/(Rcond*Ccn)];
B1 = [0; h/(Rconva*Ccn); 0; 0; 0; 0; 0; 0; 0; 0];
C1 = [1 0 0 0 0 0 0 0 0 0];
D1 = [0];

sys1 = ss(A1,B1,C1,D1);             

temp = lsim(sys1,temp_amb_cool,time_cool,[80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7 80.7]);

figure(3)
plot(time_cool,temp_sty_cool,time_cool,temp);

[time_warm,temp_cer_warm,temp_sty_warm,temp_amb_warm,t_warm]=textread('WarmingData.txt');

temp_warm = lsim(sys1,temp_amb_warm,time_warm,[1.7 1.7 1.7 1.7 1.7 1.7 1.7 1.7 1.7 1.7]);

hold on
plot(time_warm,temp_sty_warm,time_warm,temp_warm);

