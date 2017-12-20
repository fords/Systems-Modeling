b = 0.001:0.002:0.02;



for i=1:length(b)
    
c2=b(i);
[t2,theta2] = ode45(@(t2,y) syst3(t2,y,c2),x_45deg,[pi/4 0]);
%y_45deg3 = y_45deg(1:2977,1);
k(i) = sum(y_45deg - theta2(:,1)*(180/pi)).^2;

end
figure(6)
plot(b,k)

ts_min = min(k);

for i=1:length(b)

    if k(i)== ts_min
    damp = b(i);    
    end
    
end
    
c2 = damp;
[t,theta] = ode45(@(t,y) syst3(t,y,c2),x_45deg,[pi/4 0]);


figure(7)
plot(t,theta(:,1)*(180/pi));
hold on
plot(x_45deg,y_45deg);
