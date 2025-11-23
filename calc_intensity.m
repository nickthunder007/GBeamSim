function [x,y,I] = calc_intensity(z0,lambda,w0)

%lambda = 1000e-9;  % Wavelength (m)
p = 1;             % Power (arbitrary units)

% Choose the distance where you want the cross-section
%z0 = 0.005;  % meters

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
wz = w0 * sqrt(1 + (z0/zr)^2);

% Gaussian beam intensity at z0
I = (2*p / (pi * wz^2)) .* exp(-2 * R.^2 / wz^2);


