% Matthew Simpson
% Altitude Verification

power_on_mass = 1.4976;
power_off_mass = 1.431;
g = 32.174;
motor_burn_time = 2.20;
T_avg = 435.97;
density_air = 0.002377;
A = 0.2076;
cD = 0.54;

k = .5*density_air*cD*A;
q = sqrt((T_avg - power_on_mass*g)/k);
x = (2*k*q) / power_on_mass;
vmax = q*((1-exp(-x*motor_burn_time))/(1+exp(-x*motor_burn_time)));
Z_burnout = (-power_on_mass/(2*k))*log((T_avg-power_on_mass*g - k*vmax^2)/(T_avg-power_on_mass*g));
Z_coast = (power_off_mass*log((power_off_mass *g + k*vmax^2)/ (power_off_mass*g))) / (2*k);
Z_apogee = Z_coast+Z_burnout;
