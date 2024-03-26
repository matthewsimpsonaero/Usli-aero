%% Fin can ballast maximum for KE requirement 

ballast = 2.6;
inital_mass = 29.49-ballast; % lb

g = 32.2; % gravitational acceleration
Cd_main = 2.0877; % drag coefficent 
S = 50.27;%parachute area
V_d = sqrt(((inital_mass+ballast))/(0.5*S*Cd_main*0.00237717)); %ft/s

FinCan = 17.389-ballast; % mass of just the fin can

Kinetic_energy = 0.5*((FinCan+ballast)/32.174)*V_d^2; % kinetic energy of just the fin can

while Kinetic_energy<65 % for bonus points
    V_d = sqrt(((inital_mass+ballast))/(0.5*S*Cd_main*0.00237717)); %recalcualte velocity using new ballast
    Kinetic_energy = 0.5*((FinCan+ballast)/32.174)*V_d^2; % recalculate kinetic energy
    ballast = ballast+0.01; % increment ballast 
end


%% Nose Cone ballast 

ballast = 0; % initalize ballast
inital_mass = 5.386+2.82; % inital nose cone weight including deployment bay

g = 32.2;
Cd_nose_cone = 1.4396; % drag coefficent 
S = 12.566;% parachute area
V_d = sqrt(((inital_mass+ballast))/(0.5*S*Cd_nose_cone*0.00237717)); %ft/s

NoseCone = 5.386; % weight of just the nose cone

Kinetic_energy = 0.5*((NoseCone+ballast)/32.174)*V_d^2; % kinetic energy of the nose cone with ballast

while Kinetic_energy<65 % for bonus points
    V_d = sqrt(((inital_mass+ballast))/(0.5*S*Cd_nose_cone*0.00237717)); %recalcualte velocity using new ballast
    Kinetic_energy = 0.5*((NoseCone+ballast)/32.174)*V_d^2; % recalculate kinetic energy
    ballast = ballast+0.01; % increment ballast 
end

 
