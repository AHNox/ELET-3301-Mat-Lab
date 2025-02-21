t = 0:0.001:1;

A1 = 10;  f1 = 1e3;  phi1 = pi/6;
A2 = 1e-2;  f2 = 1e8; phi2 = 0;

V1 = A1 * cos(2*pi*f1*t + phi1);
V2 = A2 * cos(2*pi*f2*t + phi2);

V_total = V1 + V2;

plot(t, V1, 'r', t, V2, 'b', t, V_total, 'k');
legend('V1','V2','V_{total}');
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Superposition of Two AC Signals');
grid on;
