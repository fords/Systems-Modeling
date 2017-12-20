b=0.001:.002:.02;
% num = xlsread('SP_ModelingData_20ms_p45deg.csv');
% 
% time =num(611:end,1);
% displacement = num(611:end,2);

num = xlsread('SP_ModelingData_20ms_p45deg.csv');

time =num(611:end,1);
x= time(1)
time = time-time(1);
displacement = num(611:end,2);




for i=1:length(b)
    for j = 1:length(b)
kg = b(j);
ko = b(i);
% %set_param('try_case4/CF','kg',kg);
% SimOut = sim('try_case4');
% k3(i) = sum(displacement(1:4953,1) - SimOut*(180/pi)).^2;
SimOut = sim('case4wm_simulink');
k3(i,j) = sum(displacement - Theta_case1_45d_wm*(180/pi).^2);


    end
end

[M,I] = min(k3(:));
[I_row, I_col] = ind2sub(size(k3),I);



for i=1:length(b)
   
    for j = 1:length(b)

    if(i == I_row&&j == I_col)
     ko = b(i);
     kg = b(j);
    end
    
    end

end


figure(1)
SimOut = sim('case4wm_simulink');
plot(time,Theta_case1_45d_wm*180/pi);
hold on
plot(time,displacement);    
RMS45 = rms( displacement -    Theta_case1_45d_wm )
 

figure(2)
time2 = x_30deg(362:end,1)-x_30deg(1);
displacement = y_30deg(362:end,1);
SimOut = sim('case4wm_simulink_30deg');
plot(time2,Theta_case1_30d_wm*180/pi);
hold on
plot(time2,displacement);
RMS30 = rms( displacement -    Theta_case1_30d_wm )

figure(3)
time3 = x_90deg(355:end,1);
displacement = y_90deg(355:end,1);
SimOut = sim('case4wm_simulink_90deg');
plot(time3,Theta_case1_90d_wm*180/pi);
hold on
plot(time3,displacement);
RMS90 = rms( displacement -    Theta_case1_90d_wm )