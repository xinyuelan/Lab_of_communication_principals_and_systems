ts=1/50000;
time_interval = -0.25:ts:0.25; %sampling time instants
T=0.001;
%%time domain signal evaluated at sampling instants
m_t=(1/T).*sinc(time_interval./T);
f_c=10/T;
signal_timedomain =m_t.*cos(2*pi*f_c.*time_interval);
fs_desired = 1; %desired frequency granularity
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT
Nfft = 2^(nextpow2(Nmin)); %FFT size
signal_freqdomain = ts*fft(signal_timedomain,Nfft);
signal_freqdomain_centered = fftshift(signal_freqdomain);
fs=1/(Nfft*ts); %actual frequency resolution attained
freqs = ((1:Nfft)-1-Nfft/2)*fs;
plot(freqs,abs(signal_freqdomain_centered));
set(gca, 'XTick', [ -10500 -9500 9500 10500])
% xlabel('Frequency');
% ylabel('Magnitude Spectrum');

T=0.001;
t=[-0.01:0.0001:0.01];
m=1/T.*sinc(t./T);
u=m.*cos(2*pi*10000.*t);
subplot(2,1,1)
plot(t,u)
xlabel('t')
ylabel('u')
T=0.001
t=[-10*pi:0.01:10*pi];
m=sin(pi.*t/T)./(pi.*t);
u=m.*cos(2*pi*10000.*t);
f=[-1000*pi:1:1000*pi];
U=fft(u);
subplot(2,1,2)
plot(f,abs(U))
ylabel('magnitude of F')
xlabel('f')