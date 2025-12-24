temprature_k = 253;
v = 10; %m/s
h = 0.79; %in percentage

w = 0.5;
f_t = 2e-15 * temprature_k;
f_v = (-2.5e-15*v) + (1.2e-15*v^2) - (8.5e-17*v^3);
f_h = (-2.8e-15*h) + (2.9e-17*h^2) - (1.1e-19*h^3);

cn2 = (3.8e-14*w) + f_t + f_v + f_h - 5.3e-13;