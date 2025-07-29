% Problem B.1 [1 Mark] Section 1.11-2 (Lathi, page 128).
% Generate and plot p(t) as shown in Figure 1.50 on page 129.

t = -2:0.01:2;

p = @(t) 1.0.*(t>=0 & t<1);

% Plot for p(t) in Figure 1.50
figure Name 'Problem B.1';
plot(t, p(t));
xlabel('t'); ylabel('p(t)');
title('p(t) = u(t) - u(t-1)');
grid on; axis([-2 2 -0.1 1.1]);

% Problem B.2 [2 Marks] Use p(t) to generate and plot 
% functions r(t) = t*p(t) and n(t) = r(t) + r(-t+2)

r = @(t) t.*p(t);
n = @(t) r(t) + r(-t+2);

% Plot for r(t)
figure Name 'Problem B.2.1';
plot(t, r(t));
xlabel('t'); ylabel('r(t)');
title('r(t) = t * p(t)');
grid on; axis([-2 2 -2 2]);

% Plot for n(t)
figure Name 'Problem B.2.2';
plot(t, n(t));
xlabel('t'); ylabel('n(t)');
title('n(t) = r(t) + r(-t + 2)');
grid on; axis([-2 2 -2 2]);

% Problem B.3 [2 Marks] Plot the following two signals:
% n1(t) = n(1/2*t), n2(t) = n1(t + 1/2)

n1 = @(t) n(0.5 * t);
n2 = @(t) n1(t + 0.5);

% Plot for n1(t)
figure Name 'Problem B.3.1';
plot(t, n1(t));
xlabel('t'); ylabel('n1(t)');
title('n1(t) = n(1/2 * t)');
grid on; axis([-2 2 -2 2]);

% Plot for n2(t)
figure Name 'Problem B.3.2';
plot(t, n2(t));
xlabel('t'); ylabel('n2(t)');
title('n2(t) = n1(t + 1/2)');
grid on; axis([-2 2 -2 2]);

% Problem B.4 [2 Marks] Plot the following two signals: 
% n3(t) = n(t + 1/4), n4(t) = n3(1/2 * t)

n3 = @(t) n(t + 0.25);
n4 = @(t) n3(0.5 * t);

% Plot for n3(t)
figure Name 'Problem B.4.1';
plot(t, n3(t));
xlabel('t'); ylabel('n3(t)');
title('n3(t) = n(t + 1/4)');
grid on; axis([-2 2 -2 2]);

% Plot for n4(t)
figure Name 'Problem B.4.2';
plot(t, n4(t));
xlabel('t'); ylabel('n4(t)');
title('n4(t) = n3(1/2 * t)');
grid on; axis([-2 2 -2 2]);
