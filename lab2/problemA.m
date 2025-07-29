% Script M-file determines characteristic roots of op-amp circuit.
% Set component values:
R = [1e4, 1e4, 1e4]; C = [1e-6, 1e-6];
% Determine coefficients for characteristic equation:
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];
% Determine characteristic roots:
lambda = roots(A);
poly(lambda)
lambda = roots(A)

R = [1e4, 1e4, 1e4]; C = [1e-9, 1e-6];
% Determine coefficients for characteristic equation:
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];
% Determine characteristic roots:
lambda = roots(A);
poly(lambda)
lambda = roots(A)

%% A.2
R = [1e4, 1e4, 1e4]; C = [1e-6, 1e-6];
% Determine coefficients for characteristic equation:
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];
% Determine characteristic roots:
lambda = roots(A);
t = [0:0.0005:0.1];
u = @(t) 1.0.*(t>=0);
h = @(t) (-44.7214.*exp(lambda(2).*t) + 44.7214.*exp(lambda(1).*t)).*(u(t));
plot(t,h(t));
xlabel('Time (s)');         % Label for x-axis
ylabel('h(t)');             % Label for y-axis
title('Impulse Response h(t) of the Circuit'); % Title for the plot
grid;

%% A.3
%Below shows new characteristic roots with C = [1e-9, 1e-6]
R = [1e4, 1e4, 1e4]; C = [1e-9, 1e-6];
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];
lambda = roots(A);