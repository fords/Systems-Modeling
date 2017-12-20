function Jt = fmin2(x,Va,w_L,t,current_L)

Kt = 7.06*10^-2;
Ke = 7.06*10^-2;
Ra = 0.59; 
La = 0.87*10^-3;
D = 1.7*10^-5;
Jm = 4.7*10^-5;


a = [-Ra/La -Ke/La;Kt/(x(2)+ Jm) -(x(1)+D)/(x(2) + Jm)];
b = [1/La; 0];
c = [1 0];
d = [0];

sys = ss(a,b,c,d);
[y,t,z] = lsim(sys,Va,t);


figure(2),clf
plot(t,y,t,current_L)

RMS_fmin_current_both = rms(y - current_L);

c = [0 1];

sys = ss(a,b,c,d);
[y1,t,z] = lsim(sys,Va,t);


figure(1),clf
plot(t,y1,t,w_L*pi/180)

RMS_fmin_w_both = rms(y1 - w_L*pi/180);

ei = ((current_L - y));

ew = (w_L*pi/180 - y1);

 Jw = (ew.')*ew;
 Ji = (ei.')*ei;
 
 Jt = Jw + Ji*(Jw/Ji);

end
