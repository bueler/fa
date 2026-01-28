% FOURIER1  Show a first example of a Fourier sine series on [0,pi],
% for f(x)=x, using orthonormal set {phi_n(x) = pi^-1/2 sin(nx)}.

f = @(x) x;

% coefficients
N = 150
nn = 1:N;
c = sqrt(2 * pi) * (-1).^(nn - 1) ./ nn;

% plot some sines
figure(1)
x = 0:pi/300:pi;
for n=1:4
    plot(x, sqrt(2/pi) * sin(n*x)),  hold on
end
hold off, xlabel x, grid on
legend('\phi_1(x)', '\phi_2(x)', '\phi_3(x)', '\phi_4(x)')
print -dpng fourier1sines.png

% sum the series
s10 = zeros(size(x));
sN = s10;
for n=1:N
    if n <= 10
        s10 = s10 + c(n) * sqrt(2/pi) * sin(n*x);
    end
    sN = sN + c(n) * sqrt(2/pi) * sin(n*x);
end

% plot results
figure(2)
plot(x, s10, x, sN, x, f(x))
xlabel x,  grid on
legend('sum of 10 terms', 'sum of N terms', 'f(x)=x', 'location', 'southeast')
print -dpng fourier1result.png