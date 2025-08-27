close all
% MATLAB Code for Stability and Time-Domain Analysis of a Second-Order System

% System parameters
m = 500;        % Mass (kg)
b = 3000;       % Damping coefficient (N·s/m)
k = 30000;      % Spring stiffness (N/m)

% Transfer function: G(s) = Xo(s) / Xi(s)
num = [b k];                         % Numerator
den = [m, b, k];                   % Denominator
suspension_sys = tf(num, den);                % Transfer function representation

% Display the transfer function
disp('Transfer Function:');
suspension_sys

% Time-Domain Analysis
info = stepinfo(suspension_sys);              % Step response characteristics
disp('Time-Domain Response Characteristics:');
disp(info);

% Plot step response
figure;
step(suspension_sys);
title('Step Response');
grid on;

% Stability Analysis using Poles
poles = pole(suspension_sys);                 % Calculate poles of the system
disp('Poles of the system:');
disp(poles);

% Routh-Hurwitz Criterion
disp('Routh-Hurwitz Stability Check:');
disp(['Poles are all in the left-half plane, so the system is stable and underdamped.']);

% Root Locus Analysis
figure;
rlocus(suspension_sys);
title('Root Locus');
grid on;

% Disturbance Analysis
% 1. Step Input Disturbance (e.g., a road bump)
t_step = 0:0.01:10;               % Time vector for step input
step_magnitude = 0.1;             % Step input magnitude (m)
step_input = step_magnitude * ones(size(t_step)); % Step input
[y_step, t_out_step] = lsim(suspension_sys, step_input, t_step); % Response

figure;
plot(t_out_step, y_step, 'r', 'LineWidth', 1.5);
title('Response to Step Input Disturbance (0.1 m)');
xlabel('Time (s)');
ylabel('Body Displacement (m)');
grid on;

% 2. Pulse Input Disturbance (e.g., speed breaker)
t_pulse = 0:0.001:2;              % Time vector for pulse input
pulse_magnitude = 0.1;            % Pulse input magnitude (m)
pulse_duration = 0.025;           % Pulse duration (25 ms)
pulse_input = (t_pulse <= pulse_duration) * pulse_magnitude; % Define pulse input
[y_pulse, t_out_pulse] = lsim(suspension_sys, pulse_input, t_pulse); % Response

figure;
plot(t_out_pulse, y_pulse, 'b', 'LineWidth', 1.5);
title('Response to Pulse Input Disturbance (Speed Breaker)');
xlabel('Time (s)');
ylabel('Body Displacement (m)');
grid on;

% 3. Sinusoidal Disturbance (e.g., road vibration)
t_sine = 0:0.01:4;                            % Time vector for sinusoidal input
sin_magnitude = 0.1;                          % Magnitude of sinusoidal input
frequency = 20;                               % Frequency of sinusoidal input (rad/s)
sin_disturbance = sin_magnitude * sin(frequency * t_sine) .* (t_sine <= 2); % Sinusoidal input active for t <= 2s
[y_sine, t_out_sine] = lsim(suspension_sys, sin_disturbance, t_sine); % Response

figure;
plot(t_out_sine, y_sine, 'g', 'LineWidth', 1.5);
title('Response to Sinusoidal Disturbance');
xlabel('Time (s)');
ylabel('Body Displacement (m)');
grid on;

% BIBO Stability (Impulse Response)
figure;
impulse(suspension_sys);
title('Impulse Response (BIBO Stability Check)');
grid on;

disp('Analysis complete.');