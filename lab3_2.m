syms tao t;
kf_1=1/4;
kf_2=4;
T=0.001;
m=1000.*sinc(1000*tao);
theta1=2*pi.*kf_1*(int(m,'tao',0,t));
theta2=2*pi.*kf_2*(int(m,'tao',0,t));
v1=cos(2*pi*10000.*t+theta1);
v2=cos(2*pi*10000.*t+theta2);
t = (-2*pi/1000:0.25/10^4:2*pi/1000);
v_1=double(subs(v1));
v_2=double(subs(v2));
V1=fft(v_1,40000);
V2=fft(v_2,40000);
subplot(2,1,1)
plot(-20000:1:19999,abs(V1))
xlabel("frequency")
ylabel("magnitude")
title("k_f=1/4")
subplot(2,1,2)
plot(-20000:1:19999,abs(V2))
title('k_f=4')
xlabel('frequency')
ylabel('magnitude')