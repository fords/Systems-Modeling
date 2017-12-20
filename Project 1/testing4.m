subplot(2,2,3);
C  = [ 1 0 0 0];
sys = ss(A,B,C,D);
T= 0:.1:30;
U = ones( size(T));
[ Y, Tsim, X] = lsim (sys, U , T);
plot (Tsim, Y);
title ('Mass Spring Damper system with forcing');
ylabel('Displacement (m)');
hold on;
plot(displacement_forced,'go','MarkerSize',3,'LineWidth',.3);
tspan=(0:.1: 30);
    x1_0 = 0;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
    [t,x] = ode45(@osc,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);  
    plot(displacementSimscape_force,'b^','MarkerSize',2,'LineWidth',2)   
legend('ss','simulink','ode45','simscape');
hold off;
