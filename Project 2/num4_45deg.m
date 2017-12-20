y_45deg_cut = y_45deg(1:6000,1);
for j=1:length(b)
 for i=1:length(b)
    
kg=b(i);
ko=b(j);
[t,theta] = ode45(@(t,y) syst4(t,y,kg,ko),x_45deg(1:6000,1),[pi/4 0]);
k(i,j) = sum(y_45deg_cut - theta(:,1)*(180/pi)).^2;

 end

end
figure(6)


 
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
