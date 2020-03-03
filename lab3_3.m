fs=40000;
N=40000;
f=[-20000:19999]/N*fs;
T=0.001;
syms x t;
m=(1/T).*sinc(x/T);
the=2*pi.*int(m,'x',0,t);
theta1=the*1/4;
theta2=the*4;
v_1=cos(2*pi*10/T.*t+theta1);
v_2=cos(2*pi*10/T.*t+theta2);
t = (-2*pi/1000:0.25/10^4:2*pi/1000);
v1=double(subs(v_1));
v2=double(subs(v_2));
V1=abs(fft(v1,N));
V2=abs(fft(v2,N));
subplot(2,1,1)
plot(f,V1);
xlabel('frequency')
ylabel('magnitude')
title('k_f=1/4')
subplot(2,1,2)
plot(f,V2)
xlabel('frequency')
ylabel('magnitude')
title('k_f=4')
