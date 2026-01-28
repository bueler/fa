% FOURIER2  Second example of a Fourier sine series on [0,pi].

g = @(x) x .* (x - 1) .* (x - pi);

% coefficients
N = 7
nn = 1:N;
for n=1:N
    c(n) = integral(@(x) g(x) .* sqrt(2/pi) .* sin(n*x), 0, pi);
end

% sum the series
x = 0:pi/300:pi;
sN = zeros(size(x));
for n=1:N
    sN = sN + c(n) * sqrt(2/pi) * sin(n*x);
end
s2 = c(1) * sqrt(2/pi) * sin(x) + c(2) * sqrt(2/pi) * sin(2 * x);

% plot results
figure(1)
plot(x, s2, x, sN, x, g(x))
xlabel x,  grid on
legend('sum of 2 terms', 'sum of 7 terms', 'g(x)', 'location', 'southwest')
print -dpng fourier2result.png
