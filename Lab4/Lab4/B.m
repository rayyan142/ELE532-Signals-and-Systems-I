%% Load Data
load('Lab4_Data.mat');

% Analyze the characteristics of the data in frequency and time domains
figure(1);
plot(xspeech);
title('Original Speech Signal (xspeech)');
xlabel('Sample Index');
ylabel('Amplitude');

figure(2);
MagSpect(xspeech);
title('Magnitude Spectrum of xspeech');

figure(3);
MagSpect(hChannel);
title('Magnitude Spectrum of hChannel (Bandpass Channel)');

figure(4);
MagSpect(hLPF2000);
title('Magnitude Spectrum of hLPF2000 (Lowpass Filter)');

figure(5);
MagSpect(hLPF2500);
title('Magnitude Spectrum of hLPF2500 (Lowpass Filter)');

%% Encoder
% Step 1: Band-limit xspeech using hLPF2000
bandlimited_signal = conv(xspeech, hLPF2000, 'same');
figure(6);
MagSpect(bandlimited_signal);
title('Band-limited Signal (After hLPF2000)');

% Step 2: Modulate the band-limited signal using a carrier at 6 kHz,4000
Fc = 6000; % Carrier frequency
carrier_signal = osc(Fc, length(bandlimited_signal), 32000);
modulated_signal = bandlimited_signal .* carrier_signal;

figure(7);
MagSpect(modulated_signal);
title('Modulated Signal (Frequency Domain)');

% Step 3: Transmit the modulated signal through the channel
channel_output = conv(modulated_signal, hChannel, 'same');
figure(8);
MagSpect(channel_output);
title('Encoded Signal After Channel (Frequency Domain)');

%% Decoder
% Step 4: Demodulate the received signal using the same carrier frequency
demodulated_signal = channel_output .* carrier_signal;
figure(9);%4000
MagSpect(demodulated_signal);
title('Demodulated Signal (Frequency Domain)');

% Step 5: Filter the demodulated signal using hLPF2500 to recover xspeech
recovered_signal = conv(demodulated_signal, hLPF2500, 'same');
figure(10);
plot(recovered_signal);
title('Recovered Speech Signal (Time Domain)');
xlabel('Sample Index');
ylabel('Amplitude');

figure(11);
MagSpect(recovered_signal);
title('Recovered Speech Signal (Frequency Domain)');

%% Listen to the Original and Recovered Speech Signals
disp('Playing Original Speech Signal...');
sound(xspeech, 32000);
pause(3);

disp('Playing Recovered Speech Signal...');
sound(recovered_signal, 32000);
