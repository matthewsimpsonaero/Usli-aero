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

hDot = plot(time(1), altitude_smooth(1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
legend('Altimeter','RocketPy','Real Time Position')
% Number of points to animate
numPoints = length(time);

% Loop through each point to animate the dot
for k = 1:numPoints
    % Update the position of the red dot
    set(hDot, 'XData', time(k), 'YData', altitude_smooth(k));

    % Pause for a short duration to create animation effect
    if k == 1
        pause(0.01); % Adjust the pause duration as needed for smooth animation
    else
        pause(time(k)-time(k-1))
    end
end

legend('Altimeter','RocketPy','Real Time Position')
