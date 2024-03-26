% Matthew Simpson
% Apogee Plotter

data = readmatrix('FullScale_Huntsville_Sim.csv');

time  = data(:,1);
altitude = (data(:,4)*3.28084)-816.392;

fig = figure();
fig.Position = [100,100,800,600];
plot(time,altitude,'g-',LineWidth=2)
grid on 
grid minor
xlabel('Time (s)')
ylabel('Altitude (ft.)')
title("FRR Full Scale Rocketpy Altitude Analysis")
[val,idx] = max(altitude);
xline(time(idx),'b--',LineWidth=2)
legend('Flight Profile','Apogee')

Velocity = sqrt(data(:,5).^2 + data(:,6).^2 + data(:,7).^2);
Acceleration = sqrt(data(:,8).^2 + data(:,9).^2 + data(:,10).^2);

%%
fig = figure();
fig.Position = [100,100,800,600];
yyaxis left; % activates the left y-axis
plot(time, Velocity*3.28084, 'b-',LineWidth=2); 
ylabel('Velocity (ft/s)');
xlabel('Time (s)')

% Plot the second data set
yyaxis right; % activates the right y-axis
plot(time, Acceleration*3.28084, 'm-',LineWidth=2); 
ylabel('Acceleration (ft/s^2) ');

% Add a title and grid
title('FRR Velocity and Acceleration Profile of the Full Scale Launch Vehcile');
grid on;
grid minor
legend('Velocity','Acceleration')