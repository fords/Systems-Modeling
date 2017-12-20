% //////// Inertia connected - Model data set
clear; close all;

Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59;
La = 0;
D = 1.7*10^-5;
Jm = 4.7*10^-5;


w_L=[];w_L(1,1)=0;
[time_L,voltage_L,current_L,angle_L]=textread('DCM_Loaded_ModelingData_1_4v.txt');

Va_load= [];
Va_load(:,1)= time_L;
Va_load(:,2)= voltage_L;


for i=1:470
    w_L(i+1,1)= (angle_L(i+1)-angle_L(i,1))/.02;
end

b1 = 0:1e-4:1e-3;
b2 = 0:3e-4:1e-2;

%////////////////

for i=1:length(b1)
    for j2=1:length(b2)

J = b1(i)+ Jm;
c = b2(j2)+ D;

SimOut = sim('Second_connected');

ew = ((w_L*pi/180 - Theta));

ei = ((current_L - Current_a_connected));

 Jw(i,j2) = (ew.')*ew;
 Ji(i,j2) = (ei.')*ei;
 
 Jt(i,j2) = Jw(i,j2) + (Jw(i,j2)/Ji(i,j2))*Ji(i,j2); 
 
    end
end

figure(11)
surf(b2,b1,Jt);

[M,I] = min(Jt(:));
[I_row, I_col] = ind2sub(size(Jt),I);

for i=1:length(b1)
   
    for j2 = 1:length(b2)

    if(i == I_row&&j2 == I_col)
     J = b1(i)+ Jm;
     c = b2(j2) + D;
    end
    
    end

end


% ////////////

SimOut = sim('Second_connected');

figure(9)
plot(Time_connected,Current_a_connected);
hold on
plot(time_L,current_L);

figure(10)
plot(Time_connected,Theta);
hold on
plot(time_L,w_L*pi/180);


% /////////// Inertia connected - Validation data set


w_val_L=[];w_val_L(1,1)=0;
[time_val_L,voltage_val_L,current_val_L,angle_val_L]=textread('DCM_Loaded_ValidationData_Steps3.txt');

Va_val_load= [];
Va_val_load(:,1)= time_val_L;
Va_val_load(:,2)= voltage_val_L;


for i=1:511
    w_val_L(i+1,1)= (angle_val_L(i+1)-angle_val_L(i,1))/.02;
end


SimOut = sim('Second_connected_val');

figure(12)
plot(Time_connected_val,Current_a_connected_val);
hold on
plot(time_val_L,current_val_L);

figure(13)
plot(Time_connected_val,Theta_val);
hold on
plot(time_val_L,w_val_L*pi/180);




