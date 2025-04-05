% Parameters
A = 10;                % Amplitude in V
T = 2*pi*1e-3;         % Period in seconds (2pi ms)
f = 1 / T;             % Frequency
w = 2*pi*f;            % Angular frequency
t = linspace(0, 3*T, 1000);  % Time vector for 3 periods

% Initialize Fourier Series
vs = (A/pi) * ones(size(t)) + (A/2) * sin(w*t);  % DC + 1st sine term

% Add cosine terms for even n from 2 to 10
for n = 2:2:10
    vs = vs + (2*A / (pi*(1 - n^2))) * cos(n*w*t);
end

% Plot input signal
figure;
plot(t*1e3, vs, 'b', 'LineWidth', 2);
xlabel('Time (ms)');
ylabel('v_s(t) [V]');
title('Half-Wave Rectified Sinusoid (10-Term Fourier Series)');
grid on;
