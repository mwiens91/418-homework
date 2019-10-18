% Values x0 to iterate through
x0s = linspace(-10, 10, 10000);

% Part (a)

% Functions
x1 = @(s, x0) x0.^2*s + 2;
U1 = @(x0) x0;

% Plot
s = 1;

figure();
plot(x1(s, x0s), U1(x0s), 'k');

xlabel('x');
ylabel('u');
xlim([-10, 10]);
ylim([-10, 10]);
title('Solution at t=1');

% Part (b)

% Functions
phi = @(x0) (1 ./ (1 + x0.^2)) .* (x0 <= 0) + (1 + x0.^2) .* (x0 > 0);
x2 = @(s, x0) phi(x0).^2 * s + phi(x0);
U2 = @(x0) phi(x0);

% Plot
ss = [0, 1, 2];
plot_vals = zeros(2, length(x0s), length(ss));
idx = 1;

for s = ss
  plot_vals(:, :, idx) = [x2(s, x0s); U2(x0s)];

  idx = idx + 1;
end

figure();

plot(...
  plot_vals(1, :, 1), plot_vals(2, :, 1), 'k', ...
  plot_vals(1, :, 2), plot_vals(2, :, 2), 'k--', ...
  plot_vals(1, :, 3), plot_vals(2, :, 3), 'k:' ...
)

xlabel('x');
ylabel('u');
xlim([-2, 20]);
ylim([-2, 20]);
title('Solution at different times t');
legend(strcat('t=', string(ss)), 'location', 'northwest');
