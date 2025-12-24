function [x,y,I] = calc_intensity(z,lambda,w0)

p = 1;             % Power (arbitrary units)


% Create 2D x-y grid for cross-section
grid_size = 200;       % resolution
x = linspace(-0.01, 0.01, grid_size);
y = linspace(-0.01, 0.01, grid_size);
[X, Y] = meshgrid(x, y);

% Radial distance from beam center
R = sqrt(X.^2 + Y.^2);

% Rayleigh range
zr = pi*w0^2 / lambda;

% Beam radius at z0
wz = w0 * sqrt(1 + (z/zr)^2);

% Gaussian beam intensity at z0
I = (2*p / (pi * wz^2)) .* exp(-2 * R.^2 / wz^2);


