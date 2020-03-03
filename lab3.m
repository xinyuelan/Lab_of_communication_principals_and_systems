syms tao t;
kf_1=1/4;
kf_2=4;
T=0.001;
m=1000*sinc(1000*tao);
theta1=2*pi*kf_1*(int(m,'tao',0,t));
theta2=2*pi*kf_2*(int(m,'tao',0,t));
v1=cos(2*pi*10000*t+theta1);
v2=cos(2*pi*10000*t+theta2);
t=[-0.01:0.0001:0.01];
a=subs(v1);
b=subs(v2);
subplot(2,1,1)
plot(t,subs(v1))
title('kf=1/4')
subplot(2,1,2)
plot(t,subs(v2))
title('kf=4')