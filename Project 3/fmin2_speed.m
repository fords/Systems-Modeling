function K = fmin2(x,Va,w_L,t,current_L)

Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59; 
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;


a = [-Ra/La -Ke/La;Kt/(x(2)+ Jm) -(x(1)+D)/(x(2) + Jm)];
b = [1/La; 0];
c = [0 1];
d = [0];

sys = ss(a,b,c,d);
[y,t,z] = lsim(sys,Va,t);


 figure(3),clf
 plot(t,y,t,w_L*pi/180)

 RMS_fmin_w = rms(y - w_L*pi/180);
 
 
c = [1 0];
 
sys = ss(a,b,c,d);
[y1,t1,z] = lsim(sys,Va,t);
 

 figure(4),clf
 plot(t1,y1,t1,current_L)
 
 RMS_fmin_current = rms(y1 - current_L);
 

K = sum((w_L*pi/180 - y).^2);

end
