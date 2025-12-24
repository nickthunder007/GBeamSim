function [Y,Z,intensity_attenuation,intensity_rad_attenuation] = calc_attenuation(range, visibility_idx,lambda,w0)
    
   visibility_idx = visibility_idx+1;
   q_arr = [0, 1-0.5, 0.16*(6)+0.34, 1.3, 1.6];
   visibility_arr = [0.01,1,6,50,60];
   q = q_arr(visibility_idx);
   lambda = lambda*1e+9;
   visibility = visibility_arr(visibility_idx);

   alpha_fog = (3.91/visibility)*(lambda/550)^(-q);
   alpha_snow = 58/visibility;
   alpha_rain = 2.8/visibility;

   alpha_total_linear = (1/4.343)*(alpha_fog + alpha_rain + alpha_snow);
   alpha_total_linear = alpha_total_linear/1000; % 1/km -> 1/m
   
   [mashgZ, Z,Y,I] = calc_intensity_transvers(lambda*1e-9,w0); %lambda nm -> m
   [~,~,I_rad] = calc_intensity(range,lambda,w0);
   
   %assignin('base','exponent',exp(-alpha_total_linear*mashgZ));
   intensity_attenuation = I .* exp(-alpha_total_linear*mashgZ);
   %assignin('base','intensity_attenuation',intensity_attenuation);
    
   assignin('base','I_rad',I_rad);
   intensity_rad_attenuation = I_rad .* exp(-alpha_total_linear*range);
   assignin('base','intensity_rad_attenuation',intensity_rad_attenuation);
   
end 