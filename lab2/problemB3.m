%% B3 
%% (a)
figure(3)
u = @(t) 1.0*(t>=0);
x1 = @(t) 0.5*(u(t-4)-u(t-6));
x2 = @(t) u(t+5)-u(t+4);
dtau = 0.005;
tau = -6:dtau:4;
ti = 0;
tvec = -2:0.1:3;
y = NaN*zeros(1,length(tvec));
for t = tvec
    ti = ti+1;
    x1h = x1(t-tau).*x2(tau);
    lx1h = length(x1h);
    y(ti) = sum(x1h.*dtau);
    subplot(2,1,1), plot(tau,x2(tau),'k-',tau,x1(t-tau),'k--',t,0,'ok');
    axis([tau(1) tau(end) -2.0 2.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], [zeros(1,lx1h-1);x1h(1:end-1);x1h(2:end);zeros(1,lx1h-1)], [0.8 0.8 0.8], 'edgecolor', 'none');
    xlabel('\tau');
    title('x2(\tau) [solid], x1(t-\tau) [dashed], x2(\tau)x1(t-\tau) [gray]');
    c = get(gca, 'children');
    set(gca, 'children', [c(2);c(3);c(4);c(1)]);
    subplot(2,1,2), plot(tvec,y,'k',tvec(ti),y(ti),'ok');
    xlabel('t');
    ylabel('y(t) = \int x2(\tau)x1(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.0 2.0]);
    grid;
    drawnow;
end

%% (b)
figure(4)
y1 = @(t) 0.5*(u(t-3)-u(t-5));
y2 = @(t) u(t+5)-u(t+3);
dtau = 0.005;
tau = -6:dtau:4;
ti = 0;
tvec = -3:0.1:3;
y = NaN*zeros(1,length(tvec));
for t = tvec
    ti = ti+1;
    y1h = y1(t-tau).*y2(tau);
    ly1h = length(y1h);
    y(ti) = sum(y1h.*dtau);
    subplot(2,1,1), plot(tau,y2(tau),'k-',tau,y1(t-tau),'k--',t,0,'ok');
    axis([tau(1) tau(end) -2.0 2.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], [zeros(1,ly1h-1);y1h(1:end-1);y1h(2:end);zeros(1,ly1h-1)], [0.8 0.8 0.8], 'edgecolor', 'none');
    xlabel('\tau');
    title('y2(\tau) [solid], y1(t-\tau) [dashed], y2(\tau)y1(t-\tau) [gray]');
    c = get(gca, 'children');
    set(gca, 'children', [c(2);c(3);c(4);c(1)]);
    subplot(2,1,2), plot(tvec,y,'k',tvec(ti),y(ti),'ok');
    xlabel('t');
    ylabel('y(t) = \int y2(\tau)y1(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.0 2.0]);
    grid;
    drawnow;
end

%% (h)
figure(5)
z1 = @(t) exp(t).*(u(t+2)-u(t));
z2 = @(t) exp(-2*t).*(u(t)-u(t-1));
dtau = 0.005;
tau = -4:dtau:6;
ti = 0;
tvec = -3:0.1:2;
y = NaN*zeros(1,length(tvec));
for t = tvec
    ti = ti+1;
    z1h = z1(t-tau).*z2(tau);
    lz1h = length(z1h);
    y(ti) = sum(z1h.*dtau);
    subplot(2,1,1), plot(tau,z2(tau),'k-',tau,z1(t-tau),'k--',t,0,'ok');
    axis([tau(1) tau(end) -2.0 2.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], [zeros(1,lz1h-1);z1h(1:end-1);z1h(2:end);zeros(1,lz1h-1)], [0.8 0.8 0.8], 'edgecolor', 'none');
    xlabel('\tau');
    title('z2(\tau) [solid], z1(t-\tau) [dashed], z2(\tau)z1(t-\tau) [gray]');
    c = get(gca, 'children');
    set(gca, 'children', [c(2);c(3);c(4);c(1)]);
    subplot(2,1,2), plot(tvec,y,'k',tvec(ti),y(ti),'ok');
    xlabel('t');
    ylabel('y(t) = \int z2(\tau)z1(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.0 2.0]);
    grid;
    drawnow;
end