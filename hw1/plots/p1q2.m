% Values of s and x_0 to iterate through
s = linspace(-4, 4, 50000);
x_0s = [-1, 0, 1];

% Plotting for different time points
plot_vals = zeros(2, length(s), length(x_0s));
idx = 1;

t_val = @(s) s + 1;
x_val = @(s, x_0) x_0 * exp(s);

for x_0 = x_0s
  plot_vals(:, :, idx) = [t_val(s); x_val(s, x_0)];

  idx = idx + 1;
end

figure();
plot( ...
  plot_vals(1, :, 1), plot_vals(2, :, 1), 'k', ...
  plot_vals(1, :, 2), plot_vals(2, :, 2), 'k:', ...
  plot_vals(1, :, 3), plot_vals(2, :, 3), 'k--' ...
);

xlabel('t');
ylabel('x');
xlim([-2, 5]);
ylim([-10, 10]);
legend(strcat('x_0 =', string(x_0s)));
title('Projected characteristics');
