% LAGRANGE  Show the Lagrange interpolation process for
% 5 random points.

% the data
x = [0.5, 1.5, 2.0, 2.6, 2.9];
y = 3 * rand(1,5);

% the function  l_j(x)
ell = @(j, xx) polyval(polyfit(x, 1:5 == j, 4), xx);

% the interpolant
p = @(xx) polyval(polyfit(x, y, 4), xx);

% plot the lagrange functions
xx = 0.0:0.005:4.0;
subplot(3, 1, 1:2)
for j = 1:5
    plot(xx, ell(j, xx)),  hold on
end
plot(x, zeros(1,5), 'ko')
plot(x, ones(1,5), 'ko')
grid on, hold off
axis([0 4 -0.5 1.5])
xlabel x
legend('L_0(x)','L_1(x)','L_2(x)','L_3(x)','L_4(x)')

% plot the data and the interpolant
subplot(3, 1, 3)
plot(x, y, 'ko'),  hold on
plot(xx, p(xx))
grid on, hold off
axis([0 4 -1 5])
xlabel x
legend('(x_i,y_i)', 'p(x)')
