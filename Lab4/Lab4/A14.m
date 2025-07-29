%%A1
N=100;
PulseWidth=10;
t=[0:1:(N-1)];
x=[ones(1,PulseWidth),zeros(1,N-PulseWidth)];
z=conv(x,x);
figure;
plot(z);
grid on;
axis([-5,30,-0.1,11]);
xlabel('t');
ylabel('z(t)');
title('Figure 1: Convolution of z(t)=x(t)*x(t)');


Xw=fft(x);
f=[-(N/2):1:(N/2)-1]*(1/N);%w=2*pi*f;
Zw=Xw.*Xw;



