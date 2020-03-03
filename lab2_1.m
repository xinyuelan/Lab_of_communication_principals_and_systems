ts=0.0005; 
time_interval = -0.5:ts:0.5; %sampling time instants
T=0.001;
%%time domain signal evaluated at sampling instants
signal_timedomain=(1/T).*sinc(time_interval./T);
fs_desired = 1; %desired frequency granularity
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT 
Nfft = 2^(nextpow2(Nmin)); %FFT size
signal_freqdomain = ts*fft(signal_timedomain,Nfft);
signal_freqdomain_centered = fftshift(signal_freqdomain);
fs=1/(Nfft*ts); %actual frequency resolution attained
freqs = ((1:Nfft)-1-Nfft/2)*fs;
plot(freqs,abs(signal_freqdomain_centered));


T=0.001;
t=[-0.01:0.0001:0.01];
m=1/T.*sinc(t./T);
subplot(2,1,1)
plot(t,m)
xlabel('t')
ylabel('m')

t=[-10*pi:0.01:10*pi];
m=1/T.*sinc(t./T);
f=(-1000*pi:1:1000*pi);
Y=fft(m);
subplot(2,1,2)
plot(f,abs(Y))
xlabel('f')
ylabel('magnitude of M(f)')