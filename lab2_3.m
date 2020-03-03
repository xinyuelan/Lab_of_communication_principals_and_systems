T=0.001;
f_c=10/T;
t=-0.01:0.0001:0.01;
m=1000.*sinc(1000.*t);
u=(m+0).*cos(2*pi*f_c.*t);% A_c could be changed to 1000,2000,0
subplot(2,1,1)
plot(t,u)
title('u_A_M (t), A_c =0 ');% A_c could be changed to 1000,2000,0
subplot(2,1,2)
plot(t,abs(u))
title('m(t), A_c =0 ');% A_c could be changed to 1000,2000,0


