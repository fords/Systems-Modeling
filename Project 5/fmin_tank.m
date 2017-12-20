function k = fmin_tank(x,AreaTop,g,pho,time,H,Ic)



[t,H_ode] = ode45(@(t,y) case3_ode45(t,y,AreaTop,g,x(1),x(2),pho),time,[Ic]);



k = sum((H -H_ode).^2);




end