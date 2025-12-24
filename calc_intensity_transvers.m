function [Z,z,y,I] = calc_intensity_transvers(lambda,w0)   

    Nz = 500;           % number of z points
    Ny = 200;           % number of y points
    I0 = 1;             % peak intensity (arbitrary)

    z_R = pi * w0^2 / lambda;   %raily range
    zMax = 1.3*z_R;             % propagation distance [m]
    % Grid
    z = linspace(0, zMax, Nz);
    yMax = 5*w0;       % extent in y
    y = linspace(-yMax, yMax, Ny);
    
    [Y,Z] = meshgrid(y, z);  % y along rows, z along columns
    %assignin('base','meshg_calc_trans_z',Z);
    %assignin('base','calc_trans_z',z);

    % Beam radius at each z
    w = w0 * sqrt(1 + (Z/z_R).^2);   % element-wise
    
    % Intensity
    I = I0 * (w0./w).^2 .* exp(-2*Y.^2 ./ w.^2);
    %assignin('base','I',I);

end
