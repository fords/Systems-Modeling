

%Problem #1

A = [3 7 -1 5;4 3 2 1;12 -3 -8 9;8 6 7 -4];
B = [2 -2 8 3;2 4 1 2;8 -1 2 1;18 6 2 -9];

% a)


mult = A*B;
sum = A+B;
sub = A-B;
fprintf('A*B = \n'),disp(mult);
fprintf('\n')
fprintf('A+B = \n'),disp(sum);
fprintf('\n')
fprintf('A-B = \n'),disp(sub);
fprintf('\n')


traA = transpose(A)

C = [A B]



inve = inv(A);
fprintf('Matrix Inverse A^-1= \n'),disp(inve);
fprintf('\n');


d = det(A);
fprintf('Determinant of A ='),disp(d);
fprintf('\n');


e = eig(A);
fprintf('Eigenvalues of A= \n'),disp(e);
fprintf('\n');

[eig_vector, eig_value] = eig(A);

fprintf('Eigenvectors of A= \n'),disp(eig_vector);
fprintf('\n');



k = rank(A);
fprintf('Rank of A= '),disp(k);
fprintf('\n');



expA = expm(A);
fprintf('Matrix exponential of A= \n'),disp(expA);
fprintf('\n');

Y = log10(A(2,4));
fprintf('Log10[C(1,2)] = '),disp(Y);
fprintf('\n');


X = inv(A)*B;
fprintf('X = \n'),disp(X);
fprintf('\n');


for i=1:4
       
 for j=1:4      
if A(i,j)<0   

A(i,j)=0;

end
 end  
end

fprintf('A = \n'),disp(A);
fprintf('\n');



%Problem #2

A = [0 1;-6 -1];
B = [0 1;1 1];
C = [1 0;0 1];
D = [0.25 0;0.1 2];

[num1,den] = ss2tf(A,B,C,D,1)

[num2,den] = ss2tf(A,B,C,D,2)

fprintf('System�s eigenvalues, natural frequencies, and damping ratio ');
fprintf('\n');
damp(A)

fprintf('\n');
fprintf('Poles of the transfer functions ');
fprintf('\n');
fprintf(''),disp(roots(den));
fprintf('\n');

e = eig(A);
fprintf('\n');
fprintf('Eigenvalues = \n '),disp(e);
fprintf('\n');

%Problem 3
% a)

A = [-0.0111 -0.0788 -0.0033 -0.5615;-0.0092 -0.7531 0.9951 0;0.0062 -1.5765 -0.7453 0;0 0 1 0];
B = [0.0721;-0.1178;-9.0991;0];
C = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D = [0;0;0;0];


A1 = [-0.2316 0.0633 -0.9956 0.0510;-29.4924 -3.0169 0.0201 0;6.2346 -0.0274 -0.4169 0;0 1 0.0631 0];
B1 = [0.0052 0.0310;-36.4909 8.1090;-0.4916 -2.8274;0 0];
C1 = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D1 = [0 0;0 0;0 0;0 0];

%b)

fprintf('\n');
fprintf('System�s eigenvalues, natural frequencies, and damping ratio(longitudinal state-space model) = \n ');
damp(A)
fprintf('\n');

fprintf('\n');
fprintf('System�s eigenvalues, natural frequencies, and damping ratio(lateral/directional state-space model) = \n ');
damp(A1)
fprintf('\n');


k=1;
for i = 0:0.01:10

 T(k) = i;
    
if(i>=1)
    U(k) = -0.5;
else
    U(k) = 0;
end

k=k+1;    
end

U = U';

X0 = [0 0 0 0];                % initial conditions of the three states
sys = ss(A,B,C,D);             % construct a system model
[y,t,x] = lsim(sys, U, T, X0);            % simulate

figure(1)
plot(t,x)
title('longitudinal model');
xlabel('Time(seconds)');
ylabel('True Velocity,Angle-of-Attack,Pitch Rate,Pitch Angle');
legend('True Velocity','Angle-of-Attack','Pitch Rate','Pitch Angle','Location','northoutside','Orientation','horizontal');

% hold on
% plot(t,Out1,'b--')
% plot(t,Out2,'b--')
% plot(t,Out3,'b--')
% plot(t,Out4,'b--')


k=1;
for i = 0:0.01:10

 
    
if(i>=1)
    U1(k,1) = -0.5;
else
    U1(k,1) = 0;
end

k=k+1;    
end

k=1;
for i = 0:0.01:10

U1(k,2) = 0;


k=k+1;    
end

sys1 = ss(A1,B1,C1,D1);             % construct a system model
[y1,t1,x1] = lsim(sys1, U1, T, X0);            % simulate

figure(2)
plot(t1,x1)
title('Lateral/directional model - Aileron');
xlabel('Time(seconds)');
ylabel('Sideslip Angle,Roll Rate,Yaw Rate,Bank Angle');
legend('Sideslip Angle','Roll Rate','Yaw Rate','Bank Angle','Location','northoutside','Orientation','horizontal');


% hold on
% plot(t1,Out5,'b--')
% plot(t1,Out6,'b--')
% plot(t1,Out7,'b--')
% plot(t1,Out8,'b--')


k=1;
for i = 0:0.01:10

    
if(i>=1)
    U2(k,2) = -0.5;
else
    U2(k,2) = 0;
end

k=k+1;    
end


k=1;
for i = 0:0.01:10

U2(k,1) = 0;


k=k+1;    
end

X0 = [0 0 0 0];                % initial conditions of the three states
sys1 = ss(A1,B1,C1,D1);             % construct a system model
[y2,t2,x2] = lsim(sys1, U2, T, X0);            % simulate


figure(3)
plot(t2,x2)
title('Lateral/directional model - Rudder');
xlabel('Time(seconds)');
ylabel('Sideslip Angle,Roll Rate,Yaw Rate,Bank Angle');
legend('Sideslip Angle','Roll Rate','Yaw Rate','Bank Angle','Location','northoutside','Orientation','horizontal');

% hold on
% plot(t2,Out9,'b--')
% plot(t2,Out10,'b--')
% plot(t2,Out11,'b--')
% plot(t2,Out12,'b--')


function[m1,m2,k1,k2,c1,c2,u] = myfun(f)

    m1=2;
    m2=1;
    k1=2;
    k2=0.2;
    c1=1;
    c2=2;
    
end





