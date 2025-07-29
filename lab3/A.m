% Fourier Series Analysis with Custom sinc function (no toolboxes required)

%% Custom sinc function
function y = sinc_custom(x)
    % Custom sinc function
    % This function returns sin(pi*x)/(pi*x), handling the x = 0 case.
    y = ones(size(x));  % Initialize y to ones to handle x = 0 automatically
    non_zero = x ~= 0;  % Find non-zero elements
    y(non_zero) = sin(pi * x(non_zero)) ./ (pi * x(non_zero));  % Compute sinc for non-zero x
end

%% Function A3: Generate Fourier Coefficients
function [D] = A3(choice, n)
    % Generates array of Fourier coefficients (Dn) for:
    % - x1(t) if choice == 1
    % - x2(t) if choice == 2
    % - x3(t) if choice == 3

    % Define Dn for each signal
    D1 = zeros(size(n));
    D1((length(n)+1)/2 - 3:(length(n)+1)/2 + 3) = [0.5, 0, 0.25, 0, 0.25, 0, 0.5];
    D2 = sinc_custom(n/2) / 2;
    D3 = sinc_custom(n/4) / 4;

    % Select the appropriate Dn array based on choice
    if choice == 1
        D = D1;
    elseif choice == 2
        D = D2;
    elseif choice == 3
        D = D3;
    end
end

%% Function A4Plotter: Plot Fourier Coefficients
function [] = A4Plotter(choice, n, name)
    % Plots the Fourier coefficients of the signals x1(t), x2(t), or x3(t)
    % given the range of integer values n.
    figure;
    xn = A3(choice, n); % Get Fourier coefficients using A3

    subplot(1, 2, 1);
    stem(n, abs(xn));
    xlabel('n');
    ylabel('|D_n|');
    
    subplot(1, 2, 2);
    stem(n, angle(xn));
    xlabel('n');
    ylabel('\angleD_n');
    
    sgtitle(sprintf('Magnitude and Phase of D_n for %s(t), where %d ≤ n ≤ %d, n ∈ ℤ', name, min(n), max(n)), 'FontSize', 12);
end

%% Function A5: Reconstruct the Signal
function [x] = A5(Dn, n, w)
    % Reconstructs the original time domain signal given the array of
    % Fourier coefficients (Dn values) and the fundamental frequency w of the signal.
    t = -300:1:300; % Define time vector
    x = zeros(size(t)); % Initialize reconstructed signal

    % Loop to reconstruct the signal
    for i = 1:length(n)
        x = x + Dn(i) * exp(1j * w * n(i) * t);
    end
end

%% Function A6Plotter: Plot Reconstructed Signal
function [] = A6Plotter(x, name)
    % Plots a reconstructed signal x with respect to t, where -300 <= t <= 300 and t ∈ ℤ.
    figure;
    t = -300:1:300; % Define time vector
    plot(t, real(x)); % Plot real part of reconstructed signal
    axis([-300 300 min(real(x)) - 1 max(real(x)) + 1]);
    
    title(sprintf('Reconstruction of %s(t) using Fourier Series Coefficients', name));
    xlabel('t');
    ylabel(sprintf('%s(t)', name));
end

%% Main Script Execution

% Define ranges for Fourier coefficient indices as a cell array
ranges = {[-5:5], [-20:20], [-50:50], [-500:500]};

% Define fundamental frequencies for each signal
frequencies = [pi/10, pi/10, pi/20]; % w1, w2, w3 for x1, x2, x3

% Loop over each range to generate and plot Fourier coefficients and reconstruct signals
for i = 1:length(ranges)
    n = ranges{i}; % Access each range using curly braces {}

    % Fourier Coefficients and Plots for x1(t)
    Dn1 = A3(1, n);
    A4Plotter(1, n, 'x_1');
    x1 = A5(Dn1, n, frequencies(1));
    A6Plotter(x1, 'x_1');

    % Fourier Coefficients and Plots for x2(t)
    Dn2 = A3(2, n);
    A4Plotter(2, n, 'x_2');
    x2 = A5(Dn2, n, frequencies(2));
    A6Plotter(x2, 'x_2');

    % Fourier Coefficients and Plots for x3(t)
    Dn3 = A3(3, n);
    A4Plotter(3, n, 'x_3');
    x3 = A5(Dn3, n, frequencies(3));
    A6Plotter(x3, 'x_3');
end
