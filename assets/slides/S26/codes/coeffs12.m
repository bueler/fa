% COEFFS12  Compare magnitude of coefficients for examples
% in FOURIER1 and FOURIER2.

f = @(x) x;
g = @(x) x .* (x - 1) .* (x - pi);

N = 30;
nn = 1:N;
cf = zeros(size(nn));
cg = cf;
for n=1:N
    cf(n) = integral(@(x) f(x) .* sqrt(2/pi) .* sin(n*x), 0, pi);
    cg(n) = integral(@(x) g(x) .* sqrt(2/pi) .* sin(n*x), 0, pi);
end

figure(1)
semilogy(nn, abs(cf), 'o', nn, abs(cg), 's')
xlabel n,  ylabel('|c_n|'),  grid on
legend('|<f,\phi_n>|', '|<g,\phi_n>|')
print -dpdf coeffs12result.pdf
