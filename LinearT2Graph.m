clc; clear; close all;

% --- Input Signal Parameters ---
A = 10;
T = 2*pi*1e-3;               % 2π ms = 6.28 ms
f0 = 1/T;                    % ≈ 159 Hz
w0 = 2*pi*f0;

% --- Original Component Values ---
R1 = 1e3;                    % 1k Ohm
R2 = 20;                     % 20 Ohm
C1 = 5e-6;                   % 5 uF
C2 = 25e-9;                  % 25 nF

% --- Time Vector ---
t = linspace(0, 3*T, 2000);

% --- Initialize Signals ---
vs = (A/pi)*ones(size(t)) + (A/2)*sin(w0*t);  % Start with DC + sin
vo = zeros(size(t));                          % Output signal (DC is blocked)

% --- First Harmonic (sin) ---
w1 = w0;
H1 = (-1j*w1/(R1*C2)) / ((1j*w1 + 1/(R1*C1)) * (1j*w1 + 1/(R2*C2)));
vo = vo + real(H1 * (A/2) * exp(1j*w1*t));

% --- Add Cosine Harmonics (even n only, up to 100) ---
for n = 2:2:100
    wn = n * w0;
    An = (2*A) / (pi * (1 - n^2));
    Hn = (-1j*wn/(R1*C2)) / ((1j*wn + 1/(R1*C1)) * (1j*wn + 1/(R2*C2)));
    vs = vs + An * cos(wn*t);
    vo = vo + real(Hn * An * exp(1j*wn*t));
end

% --- Plot ---
figure;

subplot(2,1,1);
plot(t, vs, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Input Signal v_s(t) – 3 Cycles');
grid on;

subplot(2,1,2);
plot(t, vo, 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Output Signal v_o(t) – 3 Cycles (100 Harmonics)');
grid on;
