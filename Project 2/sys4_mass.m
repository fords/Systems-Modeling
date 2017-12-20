b=0.001:.0008:.02;
% num = xlsread('SP_ModelingData_20ms_p45deg.csv');
% 
% time =num(611:end,1);
% displacement = num(611:end,2);

num = xlsread('SP_ModelingData_20ms_p45deg.csv');

time =num(611:end,1);
time = time-time(1);
% time =time(1:4953,1)-time(1);
displacement = num(611:end,2);
% displacement = displacement(1:4953,1);



for i=1:length(b)
    for j = 1:length(b)
kg = b(j);
ko = b(i);
% %set_param('try_case4/CF','kg',kg);
% SimOut = sim('try_case4');
% k3(i) = sum(displacement(1:4953,1) - SimOut*(180/pi)).^2;
SimOut = sim('try_case4');
k3(i,j) = sum(displacement - Theta_case1_45d*(180/pi).^2);


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
SimOut = sim('try_case4');
plot(time,Theta_case1_45d*180/pi);
hold on
plot(time,displacement);    
RMS45 = rms( displacement -    Theta_case1_45d )    
 

figure(2)
time2 = x_30deg(362:end,1);
time2 = time2- time2(1);
displacement = y_30deg(362:end,1);
SimOut = sim('try_case4_30d');
plot(time2,Theta_case1_30d*180/pi);
hold on
plot(time2,displacement);
RMS30 = rms( displacement -    Theta_case1_30d )

figure(3)
time3 = x_90deg(355:end,1);
time3 = time3 - time3(1);
displacement = y_90deg(355:end,1);
SimOut = sim('try_case4_90d');
plot(time3,Theta_case1_90d*180/pi);
hold on
plot(time3,displacement);
RMS90 = rms( displacement -    Theta_case1_90d )




% figure(4)
% plot(b,k3)

% ts_min = min(k3)
% 
% for i=1:length(b)
% 
%     if k3(i)== ts_min
%     damp = b(i);    
%     end
%     
% end
%     
% c = damp;
% 
% c2 = c;
% SimOut = sim('case123_simulink');
% plot(time,Theta_case3*180/pi);
% hold on
% plot(time,displacement);











% b = 0.001:0.002:0.04
% 
% y_45deg_cut = y_45deg(1:1000,1);
% for j=1:length(b)
%  for i=1:length(b)
%     
% kg=b(i);
% ko=b(j);
% [t,theta] = ode45(@(t,y) syst4(t,y,kg,ko),x_45deg(1:1000,1),[pi/4 0]);
% k(i,j) = sum(y_45deg_cut - theta(:,1)*(180/pi)).^2;
% 
%  end
% 
% end
% 
% 
% 
% 
% contour3(k);
% plot(b,k)
% 
% ts_min = min(k);
% 
% for i=1:length(b)
% 
%     if k(i,j)== ts_min
%     damp = b(i);    
%     end
%     
% end
%     
% c2 = damp;
% [t,theta] = ode45(@(t,y) syst4(t,y,kg,ko),x_45deg,[pi/4 0]);
% 
% 
% figure(7)
% plot(t,theta(:,1)*(180/pi));
% hold on
% plot(x_45deg,y_45deg_cut);
