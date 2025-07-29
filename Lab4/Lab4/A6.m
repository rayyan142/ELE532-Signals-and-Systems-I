%%A1
N=100;
PulseWidth=10;
t=[0:1:(N-1)];
x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
stairs(t,x);
grid on;
axis([-10,110,-0.1,1.1])
plot(conv(x,x));
grid on;
%%A2
Xf=fft(x);
Zf=Xf.*Xf;
%%A3
subplot(211);
plot(f,fftshift(abs(Zf)));
grid on;
subplot(212);
plot(f,fftshift(angle(Zf)));
grid on;
%%A4
z=ifft(Zf);
plot(211);
plot(f,fftshift(abs(Zf)));
grid on;
ylabel('Magnitude');
plot(212);
plot(f,fftshift(angle(Zf)));
grid on;
ylabel('Phase');
plot(213);
plot(z);
grid on;
ylabel('z(t)');
%%A5
N=100;
PulseWidth=10;
t=[0:1:(N-1)];
x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
Xf=fft(x);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(Xf)));
grid on;
xlabel('\omega');
ylabel('|Z(\omega)|');
title('Figure 7: X(\omega) with original pluse width = 10');
subplot(2,1,2);
plot(f,fftshift(angle(Xf)));
grid on;
xlabel('\omega');
ylabel('\angle Z(\omega)');
title('Figure 8:Phase of X(\omega) with pluse width = 10');
%width=5
N=100;
PulseWidth=5;

x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
Xf=fft(x);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(Xf)));
grid on;
xlabel('\omega');
ylabel('|Z(\omega)|');
title('Figure 9: X(\omega) with pluse width = 5');
subplot(2,1,2);
plot(f,fftshift(angle(Xf)));
grid on;
xlabel('\omega');
ylabel('\angle Z(\omega)');
title('Figure 10:Phase of X(\omega) with pluse width = 5');
%width=25
N=100;
PulseWidth=25;

x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
Xf=fft(x);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(Xf)));
grid on;
xlabel('\omega');
ylabel('|Z(\omega)|');
title('Figure 11: X(\omega) with original pluse width = 25');
subplot(2,1,2);
plot(f,fftshift(angle(Xf)));
grid on;
xlabel('\omega');
ylabel('\angle Z(\omega)');
title('Figure 12:Phase of X(\omega) with pluse width = 25');


%%A6
N=100;
PulseWidth=10;
t=[0:1:(N-1)];
x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
wt=x.*(exp(1i*(pi/3).*t));
wtw=fft(wt);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(wtw)));
grid on;
xlabel('t');
ylabel('|w+(t)|');
title('Figure 13: Magnitude plot of w+(t)');
subplot(2,1,2);
plot(f,fftshift(angle(wtw)));
grid on;
xlabel('t');
ylabel('\angle w+(t)');
title('Figure 14:Phase plot of w+(t)');
%w-(t)
wt=x.*(exp(-1i*(pi/3).*t));
wtw=fft(wt);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(wtw)));
grid on;
xlabel('t');
ylabel('|w-(t)|');
title('Figure 15: Magnitude plot of w-(t)');
subplot(2,1,2);
plot(f,fftshift(angle(wtw)));
grid on;
xlabel('t');
ylabel('\angle w-(t)');
title('Figure 16:Phase plot of w-(t)');
%wc(t)
wt=x.*(cos((pi/3).*t));
wtw=fft(wt);
f=[-(N/2):1:(N/2)-1]*(1/N);
figure;
subplot(2,1,1);
plot(f,fftshift(abs(wtw)));
grid on;
xlabel('t');
ylabel('|wc(t)|');
title('Figure 17: Magnitude plot of wc(t)');
subplot(2,1,2);
plot(f,fftshift(angle(wtw)));
grid on;
xlabel('t');
ylabel('\angle wc(t)');
title('Figure 18:Phase plot of wc(t)');
