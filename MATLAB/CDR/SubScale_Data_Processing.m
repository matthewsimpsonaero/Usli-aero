% Matthew Simpson
% Subscale Data Processing
close all

data = readmatrix('dtl31_Corrected.csv');
altitude = data(:,2);
time = data(:,1);
vel = data(:,4);

altitude_smooth = smoothdata(altitude,"sgolay",9);
vel_smooth = smoothdata(vel,"sgolay");

data_rp = readmatrix('Subscale_Rocketpy_Simulation.csv');

time_rp = data_rp(:,1);
altitude_rp = (data_rp(:,4)-8.772864)*3.28084;
velocity_rp = sqrt(data_rp(:,5).^2+data_rp(:,6).^2+data_rp(:,7).^2)*3.28084;
accel_rp = sqrt(data_rp(:,8).^2+data_rp(:,9).^2+data_rp(:,10).^2)*3.28084;

fig = figure();
fig.Position = [100 100 800 700];
plot(time,altitude_smooth,'g','LineWidth',2)
hold on
plot(time_rp,altitude_rp,'b','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)')
ylabel('Altitude (Ft.)')
title("Subscale Launch Altitude Vs. Time Comparison")
legend('Altimeter','RocketPy')

fig = figure();
fig.Position = [100 100 800 700];
plot(time,abs(vel_smooth),'r','LineWidth',2)
hold on
plot(time_rp,velocity_rp,'b','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)')
ylabel('Velocity (Ft/s)')
title("Subscale Launch Velocity Magnitude Vs. Time Comparison")
legend('Altimeter','RocketPy')
xlim([0,max(time)])



%%
minimum = 91;
maximum = 92;
figure
plot(time(minimum :maximum),vel_smooth(minimum:maximum))
coef = polyfit(time(minimum :maximum),vel_smooth(minimum :maximum),1);

a = diff(vel_smooth)*20;

F_decleration = a*0.444448945037; % mass of rocket without prop
F_gravity = 0.444448945037*-32.174;

F_drag = F_decleration + F_gravity;


Fdrag = -F_drag*4.4482216153; % N
vel = 54.2544; %m/s;
rho = 1.225;
A = 0.0082;

Cd = Fdrag./(.5.*rho.*vel_smooth(1:end-1).^2.*A)

target = 0.53;

% Calculate the absolute differences
differences = abs(Cd - target);

minDifference = min(differences);

% Find the index of the minimum difference
minIndex = find(differences == minDifference, 1);

% Find the value in the set that is closest to the target
closestValue = Cd(minIndex);

% Display the result
fprintf('The value closest to %.2f in the set is %.2f.\n', target, closestValue);