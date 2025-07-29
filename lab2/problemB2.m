%% B2
figure(2)
m = @(t) u(t)-u(t-2);
n = @(t) (t+1).*(u(t+1)-u(t));
dtau = 0.005;
tau = -4:dtau:5;
ti = 0;
tvec = -1.5:0.1:3;
y = NaN*zeros(1,length(tvec));
for t = tvec
    ti = ti+1;
    mh = m(t-tau).*n(tau);
    lmh = length(mh);
    y(ti) = sum(mh.*dtau);
    subplot(2,1,1), plot(tau,n(tau),'k-',tau,m(t-tau),'k--',t,0,'ok');
    axis([tau(1) tau(end) -2.0 2.5]);
    patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], [zeros(1,lmh-1);mh(1:end-1);mh(2:end);zeros(1,lmh-1)], [0.8 0.8 0.8], 'edgecolor', 'none');
    xlabel('\tau');
    title('n(\tau) [solid], m(t-\tau) [dashed], n(\tau)m(t-\tau) [gray]');
    c = get(gca, 'children');
    set(gca, 'children', [c(2);c(3);c(4);c(1)]);
    subplot(2,1,2), plot(tvec,y,'k',tvec(ti),y(ti),'ok');
    xlabel('t');
    ylabel('y(t) = \int n(\tau)m(t-\tau) d\tau');
    axis([tau(1) tau(end) -1.0 2.0]);
    grid;
    drawnow;
end
