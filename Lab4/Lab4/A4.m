%%A4
% Assuming N, PulseWidth, etc., are defined elsewhere
t = [0:1:(N-1)]; % Time vector
x = [ones(1,PulseWidth), zeros(1,N-PulseWidth)]; % Pulse signal
z = conv(x, x); % Convolution of x with itself

Xw = fft(x); % FFT of x
f = [-(N/2):1:(N/2)-1]*(1/N); % Frequency vector

Zw = Xw .* Xw; % Power spectral density (squared magnitude of FFT)

z_ifft = ifft(Zw); % Inverse FFT of Zw

% Plot magnitude and phase of Zw
subplot(2,1,1);
plot(f, fftshift(abs(Zw)));
grid on;
ylabel('Magnitude');
title('Magnitude Spectrum of Zw');

subplot(2,1,2);
plot(f, fftshift(angle(Zw)));
grid on;
ylabel('Phase');
title('Phase Spectrum of Zw');

% Plot convolution result (z)
figure;
plot(z);
grid on;
ylabel('z(t)');
title('Convolution Result (x * x)');
