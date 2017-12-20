function xp = oscnonlinear(t,x)

%clc;
%clear;
%subplot(2,2,1);
m1 = 2; m2 = 1; k1 = 5; k2= .2; c1 = 1; c2 = 2;

%xp = zeros(4,1);
f=1;
%syms  x1(t) x2(t) f(t)
%[V]= odeToVectorField(m1*diff(x1,2) + k1*x1 - k2(x2-x1) + c1*diff(x1)+ c2*(diff(x2)-diff(x1)) == 0);
%[V2]= odeToVectorField(m2*diff(x2,2)+k2*(x2-x1)+c2*(diff(x2)-diff(x1))==f);

%dxdt(1) = v(1);
%dxdt(2) = v(2);
xp(1,1) = x(2);
xp(2,1) = -k1/m1*x(1)*x(1)*x(1)-(k2/m1)*x(1)+(-c1/m1-c2/m1)*x(2)+k2/m1*x(3)+c2/m1*x(4);
xp(3,1) = x(4);
xp(4,1) = k2/m2*x(1) + c2/m2*x(2)-(k2/m2)*x(3)-(c2/m2)*x(4)+f/m2;

end