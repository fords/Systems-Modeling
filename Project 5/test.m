clear all;
close all;

[time,H1,H2,Volt]=textread('TT_PumpCal_5_exc.txt');

plot(time,H1,time,H2,time,Volt);

%[time,H1,H2,Volt]=textread('TT_BottomTankDrain_10mm_4_exc.txt');
%[time,H1,H2,Volt]=textread('TT_TopTankDrain_0.295in_3_exc.txt');


%plot(time,H1,time,H2,time,Volt);