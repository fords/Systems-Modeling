
subplot(2,2,1);

m1 = 2; m2 = 1; k1 = 2; k2= .2; c1 = 1; c2 = 2;
A  = [ 0             1                0            0
      -k1/m1-k2/m1   -c1/m1-c2/m1    k2/m1        c2/m1
      0              0                0            1
      k2/m2          c2/m2           -k2/m2       -c2/m2];
  
B  = [ 0
       0
       0
       1/m2];
  
C  = [ 1 0 0 0];
D  = 0;
x0 = [ 1; 0; 0; 0];


displacementSimscape_force    = evalin('caller','displacementSimscape_force');
displacementSimscape_noforced = evalin ('caller', 'displacementSimscape_noforced');
displacement_forced      =evalin('caller','displacement_forced');
displacement_noforcing   =evalin('caller','displacement_noforcing');
 
velocitySimscape_force     = evalin('caller','velocitySimscape_force');
velocitySimscape_noforced  = evalin('caller','velocitySimscape_noforced');
velocity_forced            = evalin('caller','velocity_forced');
velocity_noforcing         = evalin('caller','velocity_noforcing');


sys = ss(A,B,C,D);
sysd = c2d(sys, .1);
step(sysd)
initial (sysd,x0)
hold on;

plot(displacement_noforcing,'go','MarkerSize',3,'LineWidth',.3)
tspan=(0:.1: 30);
    x1_0 = 1;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for not forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
    [t,x] = ode45(@oscnoforced,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
plot(displacementSimscape_noforced,'b^','MarkerSize',2,'LineWidth',2)   
title ('Mass Spring Damper system with no forcing');
ylabel('Displacement (m)');
legend('ss','simulink','ode45','simscape');
hold off;

% Velocity Time graph
 subplot(2,2,2);
C= [0 0 0 1];
sys = ss(A,B,C,D);
sysd = c2d(sys, .1);
step(sysd,0:.1:30);
initial (sysd,x0,0:.1:30);

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

%Displacemnt of mass 1 with time with being forced

subplot(2,2,3);
C  = [ 1 0 0 0];
sys = ss(A,B,C,D);
T= 0:.1:30;
U = ones( size(T));
[ Y, Tsim, X] = lsim (sys, U , T);
plot (Tsim, Y);

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
title ('Mass Spring Damper system with forcing');
ylabel('Displacement (m)');
xlabel('Time (seconds)');
hold off;

%%velocity of mass 2 with time with being forced

subplot(2,2,4);
hold on;
C= [0 0 0 1];
sys = ss(A,B,C,D);
[ velocity, Tsim, X] = lsim (sys, U , T);
plot (Tsim, velocity)

plot(velocity_forced,'go','MarkerSize',3,'LineWidth',.3);
tspan=(0:.1: 30);
    x1_0 = 0;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
    [t,x] = ode45(@osc,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,4),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
 plot(velocitySimscape_force ,'b^','MarkerSize',2,'LineWidth',2)   
legend('ss','simulink','ode45','simscape');
title ('Mass Spring Damper system with forcing');
ylabel('Velocity (m/s)');
xlabel('Time (seconds)');
hold off;