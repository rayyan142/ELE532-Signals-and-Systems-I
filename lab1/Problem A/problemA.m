% Problem A.1 [1 Mark] Section 1.11-1 (Lathi, page 126). 
% Generate and plot Figures 1.46 and 1.47 on page 127.

t1 = -2:1:2;           
t2 = -2:0.01:2;       

f = @(t) exp(-t).*cos(2*pi*t);

% Plot for Figure 1.46
figure Name 'Problem A.1.1';
plot(t1, f(t1));
xlabel('t'); ylabel('f(t)');
title('f(t) = e^{-t} cos(2\pi t) for t = [-2:2]');
grid on; 
axis([-2 2 0 8]);

% Plot for Figure 1.47
figure Name 'Problem A.1.2';
plot(t2, f(t2));
xlabel('t'); ylabel('f(t)');
title('f(t) = e^{-t} cos(2\pi t) for t = [-2:0.01:2]');
grid on; axis([-2 2 -5 10]);

% Problem A.2 [1 Mark] Plot the function e^−t
% for five points [-2,-1,0,1,2] using t=[-2:2].
t3 = [-2, -1, 0, 1, 2];

f2 = @(t) exp(-t);

% Plot for e^-t
figure Name 'Problem A.2';
plot(t3, f2(t3));
xlabel('t'); ylabel('f(t)');
title('Plot of e^{-t} for t = [-2, -1, 0, 1, 2]');
grid on;

