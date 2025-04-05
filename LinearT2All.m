clc; clear; close all;

% Parameters
A = 10;
T = 2*pi*1e-3;
f0 = 1/T;
w0 = 2*pi*f0;

% Component values
R1 = 1e3;
R2 = 20;
C1 = 5e-6;
C2 = 25e-9;

% Table initialization
maxN = 10;
n_vals = (1:maxN)';
omega_n = n_vals * w0;

a_n = zeros(maxN,1);    % Cosine coeffs
b_n = zeros(maxN,1);    % Sine coeffs
A_n = zeros(maxN,1);    % Amplitude of input harmonic
phi_n = zeros(maxN,1);  % Phase of input harmonic
H_mag = zeros(maxN,1);  % |H(jω)|
H_phase = zeros(maxN,1);% ∠H(jω)
v_out_mag = zeros(maxN,1); % Output amplitude

% Compute each row
for n = 1:maxN
    wn = n * w0;

    % Fourier coefficients for half-wave rectified sine
    if n == 1
        a_n(n) = 0;
        b_n(n) = A/2;
    elseif mod(n,2) == 0
        a_n(n) = (2*A) / (pi*(1 - n^2));
        b_n(n) = 0;
    else
        a_n(n) = 0;
        b_n(n) = 0;
    end

    % Magnitude and phase of input harmonic
    A_n(n) = sqrt(a_n(n)^2 + b_n(n)^2);
    phi_n(n) = atan2(-b_n(n), a_n(n));  % Note: negative b_n for cosine phase

    % Transfer function H(jw_n)
    Hn = (-1j*wn/(R1*C2)) / ((1j*wn + 1/(R1*C1)) * (1j*wn + 1/(R2*C2)));
    H_mag(n) = abs(Hn);
    H_phase(n) = rad2deg(angle(Hn));

    % Output amplitude
    v_out_mag(n) = A_n(n) * H_mag(n);
end

% Create table
T_table = table(n_vals, omega_n, a_n, b_n, A_n, rad2deg(phi_n), H_mag, H_phase, v_out_mag, ...
    'VariableNames', {'n','omega_n','a_n','b_n','A_n','phi_n_deg','H_mag','H_phase_deg','v_out_mag'});

disp(T_table);
