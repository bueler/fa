% DISKLAPLACE  Animate the harmonic extension on the unit disk, building
% up the solution to Laplace's equation term by term from a finite Fourier
% series on the boundary.
%
% Boundary condition:  f(theta) = sum_{j=1}^{6} (4/pi) * sin((2j-1)*theta) / (2j-1)
%   (6-term Fourier approximation of a square wave)
% Interior solution:   u(r,theta) = sum_{j=1}^{6} (4/pi) * r^n * sin(n*theta) / n
%   where n = 2j-1.  This u satisfies Laplace's equation and u|_{bdry} = f.

% 6-term square wave: nonzero modes at odd n = 1, 3, 5, 7, 9, 11
nterms = [1, 3, 5, 7, 9, 11];
N = length(nterms);
bnsq = (4/pi) ./ nterms;   % Fourier sine coefficients

% polar grid on the disk
Nr     = 80;
Ntheta = 240;
r     = linspace(0, 1, Nr);
theta = linspace(0, 2*pi, Ntheta + 1);
[R, TH] = meshgrid(r, theta);
X = R .* cos(TH);
Y = R .* sin(TH);

% fine grid for boundary curve
thfine = linspace(0, 2*pi, 800);

% precompute full 6-term boundary function for axis limits
fbdryfull = zeros(size(thfine));
for j = 1:N
    fbdryfull = fbdryfull + bnsq(j) * sin(nterms(j)*thfine);
end
zmax = max(abs(fbdryfull)) * 1.15;

% show phi_3(r,theta)
close all
figure(1);
U = R.^3 .* cos(3*TH);
surf(X, Y, U, 'EdgeColor', 'none');
colormap(jet);
colorbar;
view(2);
axis equal;
axis([-1.1 1.1 -1.1 1.1]);
xlabel('x', 'FontSize', 11);
ylabel('y', 'FontSize', 11);
print -dpng phi3.png
close all

% animate: frame k shows the partial sum through k Fourier modes
figure(2);
set(gcf, 'Position', [100 100 1000 480]);

for k = 0:N
    % partial sum of harmonic extension
    U = zeros(size(R));
    for j = 1:k
        n = nterms(j);
        U = U + bnsq(j) * R.^n .* sin(n*TH);
    end

    % partial sum of boundary function
    fbdry = zeros(size(thfine));
    for j = 1:k
        n = nterms(j);
        fbdry = fbdry + bnsq(j) * sin(n*thfine);
    end

    clf;

    % left panel: harmonic extension on disk (top-down view)
    subplot(1, 2, 1);
    surf(X, Y, U, 'EdgeColor', 'none');
    colormap(jet);
    clim([-zmax, zmax]);
    colorbar;
    view(2);
    axis equal;
    axis([-1.1 1.1 -1.1 1.1]);
    xlabel('x', 'FontSize', 11);
    ylabel('y', 'FontSize', 11);
    if k == 0
        title('u = 0  (no terms yet)', 'FontSize', 12);
    else
        title(sprintf('u = (sum of %d modes)', k), 'FontSize', 12);
    end

    % right panel: boundary function f(theta)
    subplot(1, 2, 2);
    plot(thfine, fbdryfull, 'Color', [0.7 0.7 0.7], 'LineWidth', 1);
    hold on;
    plot(thfine, fbdry, 'b-', 'LineWidth', 2);
    hold off;
    xlim([0, 2*pi]);
    ylim([-zmax, zmax]);
    set(gca, 'XTick', [0, pi/2, pi, 3*pi/2, 2*pi], ...
             'XTickLabel', {'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
    xlabel('\theta', 'FontSize', 12);
    ylabel('f(\theta)', 'FontSize', 12);
    if k == 0
        title('boundary: 0 terms', 'FontSize', 12);
    else
        title(sprintf('boundary: %d-term partial sum', k), 'FontSize', 12);
    end
    grid on;

    drawnow;
    pause(1.8);
end
