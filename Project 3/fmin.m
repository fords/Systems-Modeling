function Jt = fmin(x)


% a = x(1); %J
% b = x(2); %c

Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59;
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;

w_L=[];w_L(1,1)=0;
% [time_L,voltage_L,current_L,angle_L]=textread('DCM_Loaded_ModelingData_1_4v.txt');

Va_load= [];
Va_load(:,1)= time_L;
Va_load(:,2)= voltage_L;


for i=1:470
    w_L(i+1,1)= (angle_L(i+1)-angle_L(i,1))/.02;
end

J =a + Jm;
c =b + D;

SimOut = sim('Second_connected');

% k = sum((w_L*pi/180 - Theta).^2);

ew = (w_L*pi/180 - Theta);

ei = (current_L - Current_a_connected);

 Jw = (ew.')*ew;
 Ji = (ei.')*ei;
 
 Jt = Jw + (Jw/Ji)*Ji; 
end

