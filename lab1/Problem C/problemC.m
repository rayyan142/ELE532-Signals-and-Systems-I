% Problem C.1 [1 Mark] 
% Section 1.11-33 (Lathi, page 130).
% Generate and plot g(t) = f(t)u(t) where f(t) = e^(-2t) cos(4πt).

t = -2:0.01:2;

f = @(t) exp(-2*t).*cos(4*pi*t);
u = @(t) t >= 0;
g = @(t) f(t).*u(t);

% Plot for g(t)
figure Name 'Problem C.1';
plot(t, g(t));
xlabel('t'); ylabel('g(t)');
title('g(t) = e^{-2t} cos(4\pi t) u(t)');
grid on; axis([-2 2 -1 1]);

% Problem C.2 [1 Mark]
% Using g(t) in C.1, generate and plot s(t) = g(t+1).

s = @(t) g(t + 1);

% Plot for s(t)
figure Name 'Problem C.2';
plot(t, s(t));
xlabel('t'); ylabel('s(t)');
title('s(t) = g(t + 1)');
grid on; axis([-2 2 -1 1]);

% Problem C.3 [3 Marks]
% Plot s_α(t) = e^{-2} e^{-αt} cos(4pit) u(t) for α = [1, 3, 5, 7].

t3 = 0:0.01:4;

alpha_values = [1, 3, 5, 7];

figure Name 'Problem C.3';
hold on;
for i = 1:length(alpha_values)
    alpha = alpha_values(i);
    
    s_alpha = exp(-2) * exp(-alpha * t3) .* cos(4 * pi * t3) .* u(t3);
    
    % Plot for each s_α(t)
    plot(t3, s_alpha);
end
hold off;

xlabel('t');
ylabel('s_\alpha(t)');
title('Plot of s_\alpha(t) for \alpha = [1, 3, 5, 7]');
legend show;
grid on;

% Problem C.4 [1 Mark]
% Determine the size of the matrix you generated in C.3.
size_matrix = size(s_alpha);
disp(size_matrix);
