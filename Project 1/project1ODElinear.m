
subplot(2,2,1);
hold on;
m1 = 2; m2 = 1; k1 = 5; k2= .2; c1 = 1; c2 = 2;
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

% 
% 
% displacement_forced      =evalin('caller','displacement_forced');
% displacement_noforcing   =evalin('caller','displacement_noforcing');
% 
% velocity_forced            = evalin('caller','velocity_forced');
% velocity_noforcing         = evalin('caller','velocity_noforcing');


hold on;



tspan=(0:.1: 30);


    x1_0 = 1;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for not forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
     [t,x] = ode45(@oscnoforced,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'go','MarkerSize',3,'LineWidth',.3)
    [t,x] = ode45(@oscnoforcednonlinear,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
title ('Mass Spring Damper system with no forcing');
ylabel('Displacement (m)');
xlabel('Time (seconds)');
legend('ode45linear','nonlinear');
hold off;

% Velocity Time graph
 subplot(2,2,2);


hold on;

tspan=(0:.1: 30);
    x1_0 = 1;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for not forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
     [t,x] = ode45(@oscnoforced,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,4),'go','MarkerSize',3,'LineWidth',.3);
    [t,x] = ode45(@oscnoforcednonlinear,tspan, [x1_0 x2_0 x3_0 x4_0]);
    
    plot(t,x(:,4),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
   
legend('ode45linear','nonlinear');
title ('Mass Spring Damper system with no forcing');
ylabel('Velocity (m/s)');
xlabel('Time (seconds)');
hold off;

%Displacemnt of mass 1 with time with being forced

subplot(2,2,3);

hold on;

tspan=(0:.1: 30);
    x1_0 = 0;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
     [t,x] = ode45(@osc,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'go','MarkerSize',3,'LineWidth',.3); 
    [t,x] = ode45(@oscnonlinear,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,1),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);  

legend('ode45linear','nonlinear');
title ('Mass Spring Damper system with forcing');
ylabel('Displacement (m)');
xlabel('Time (seconds)');
hold off;

%%velocity of mass 2 with time with being forced

subplot(2,2,4);
hold on;


tspan=(0:.1: 30);
    x1_0 = 0;  %x1_0 =0 and f=1 for forced, x1_0=1 f=0 for forced 
    x2_0 = 0;
    x3_0 = 0;
    x4_0 = 0;
    [t,x] = ode45(@osc,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,4),'go','MarkerSize',3,'LineWidth',.3); 
    [t,x] = ode45(@oscnonlinear,tspan, [x1_0 x2_0 x3_0 x4_0]);
    plot(t,x(:,4),'r--','LineWidth',1,'LineStyle',':','Color',[1 0 0]);
  
legend('ode45linear','nonlinear');
title ('Mass Spring Damper system with forcing');
ylabel('Velocity (m/s)');
xlabel('Time (seconds)');
hold off;