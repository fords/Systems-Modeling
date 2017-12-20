% Velocity Time graph
% hold on;
 subplot(2,2,2);
C= [0 0 0 1];
sys = ss(A,B,C,D);
sysd = c2d(sys, .1);


step(sysd,0:.1:30)
initial (sysd,x0,30);


hold on;
plot(velocity_noforcing,'go','MarkerSize',3,'LineWidth',.3);

tspan=(0:.1: 30);
    x1_0 = 1;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for not forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
    [t,x] = ode45(@oscnoforced,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,4),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
    plot(velocitySimscape_noforced,'b^','MarkerSize',2,'LineWidth',2)   
legend('ss','simulink','ode45','simscape');
title ('Mass Spring Damper system with no forcing');

ylabel('Velocity (m/s)');

hold off;