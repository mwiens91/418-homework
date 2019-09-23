% Values of s and x0 to iterate through
ss = [1, 2, 3];
x0s = linspace(-10, 10, 10000);

% Part (a)

% Functions
h1 = @(x) 1/2 * (x < -2) - 1/2 * (x > 2) - 1/4 * x .* (x >= -2 & x <= 2);
x1 = @(s, x0) h1(x0) * s + x0;
U1 = @(x0) h1(x0);

% Plotting for different time points
plot_vals = zeros(2, length(x0s), length(ss));
idx = 1;

for s = ss
  plot_vals(:, :, idx) = [x1(s, x0s); U1(x0s)];

  idx = idx + 1;
end

for idx = 1:length(ss)
  figure();
  plot(plot_vals(1, :, idx), plot_vals(2, :, idx), 'k');

  xlabel('x');
  ylabel('u');
  xlim([-4, 4]);
  ylim([-1, 1]);
  title(strcat('Solution at t=', string(ss(idx))));
end

% Part (b)

% Functions
h2 = @(x) -1/2 * (x < -2) + 1/2 * (x > 2) + 1/4 * x .* (x >= -2 & x <= 2);
x2 = @(s, x0) h2(x0) * s + x0;
U2 = @(x0) h2(x0);

plot_vals = zeros(2, length(x0s), length(ss));
idx = 1;

for s = ss
  plot_vals(:, :, idx) = [x2(s, x0s); U2(x0s)];

  idx = idx + 1;
end

for idx = 1:length(ss)
  figure();
  plot(plot_vals(1, :, idx), plot_vals(2, :, idx), 'k');

  xlabel('x');
  ylabel('u');
  xlim([-4, 4]);
  ylim([-1, 1]);
  title(strcat('Solution at t=', string(ss(idx))));
end
