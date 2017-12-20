%clc, clear, format compact, format short g, close all

A = [0 1 0 0;-1.1 -1.5 0.1 1;0 0 0 1;0.2 2 -0.2 -2];
B = [0;0;0;1];
C = [1 0 0 0;0 0 0 1];
D = [0;0];

% Case 2
T = 0:0.1:30;                  % simulation time = 10 seconds
U = ones(size(T));             % u = 1, a step input
X0 = [0 0 0 0];                % initial conditions of the three states
sys = ss(A,B,C,D);             % construct a system model
subplot(2,2,1)
lsim(sys, U, T, X0)            % simulate
title('Matlab lsim  - Case 2')


subplot(2,2,2)
plot(time,X1);
 hold on
 plot(time,DX2);
title('Simulation using Simulink - Case 2');
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');


%case2

[time,Y] = ode45(@system1,T,[0 0 0 0]);

subplot(2,2,3)
plot(time,Y(:,1));
hold on
plot(time,Y(:,4));
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');
title('Simulation using ODE45 - Case 2');


subplot(2,2,4)
plot(T,X1sim);
hold on
plot(T,dX2sim);
title('Simulation using Simscape F=1');
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');

%Case 1
subplot(2,2,1)
initial(sys,[1 0 0 0],T)
title('Simulation using "Initial" - Case 1')

subplot(2,2,2)
plot(time,X1);
 hold on
 plot(time,DX2);
title('Simulation using Simulink - Case 1');
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');

[time,Y] = ode45(@system1,T,[1 0 0 0]);

subplot(2,2,[3,4])
plot(time,Y(:,1));
hold on
plot(time,Y(:,4));
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');
title('Simulation using ODE45 - Case 1');

[time,Y] = ode45(@system1,T,[0 0 0 0]);
% 
% subplot(2,2,3)
% plot(time,Y(:,1));
% hold on
% plot(time,Y(:,4));
% xlabel('Time(seconds)');
% ylabel('X1,dX2/dt');
% legend('X1','dX2/dt');
% title('Simulation using ODE45 - Case 2');




[time,Y] = ode45(@systemnon,T,[0 0 0 0]);

%CASE 1 AND 2, CHANGE PARAMETERS
subplot(1,2,1)
plot(time,Y(:,1));
hold on
plot(time,Y(:,4));
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');
title('Simulation using ODE45(case2) - nonlinear spring');

subplot(1,2,2)
plot(time,X1non);
hold on
plot(time,DX2non);
title('Simulation using Simulink(case2) - nonlinear spring');
xlabel('Time(seconds)');
ylabel('X1,dX2/dt');
legend('X1','dX2/dt');


