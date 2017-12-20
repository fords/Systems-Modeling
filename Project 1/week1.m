clc;
clear;
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
sys = ss(A,B,C,D);
sysd = c2d(sys, .1);

step(sysd)
initial (sysd,x0)
title ('Mass Spring Damper system with no forcing');
subplot(2,2,2);
C= [0 0 0 1];
sys = ss(A,B,C,D);
sysd = c2d(sys, .1);
step(sysd)
initial (sysd,x0)