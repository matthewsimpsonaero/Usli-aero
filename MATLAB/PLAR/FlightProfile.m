% Matthew Simpson
% Apogee Plotter
clc;clear;close all

datareal = readmatrix('HuntsvilleFlight.csv');

time = datareal(:,1);
altitude = datareal(:,2);
velocity = datareal(:,4);
vel_smooth = smoothdata(velocity,"sgolay");

fig = figure();
fig.Position = [100 100 940 600];
plot(time,altitude,'g-',LineWidth=2)
hold on
xline(15.9,'b-.',LineWidth=2)
xline(55.2,'k:',LineWidth=2)
grid on
grid(gca,'minor')
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Altitude (ft.)',FontSize=16)
title('Huntsville Competition Flight Altitude vs. Time',FontSize=16)
legend('Flight Profile','Drogue Deployment','Main Deployment',fontsize=16,Location="southoutside",Orientation='horizontal')

fig = figure();
fig.Position = [100 100 940 600];
plot(time, abs(velocity), '-', 'LineWidth', 2, 'Color', [0.0, 0.4470, 0.7410,0.1]); % Nice blue
hold on;
plot(time, abs(vel_smooth), '-', 'Color', [0.75, 0, 0.75], 'LineWidth', 2); % Yellow
xline(15.9, 'b-.', 'LineWidth', 2); % Blue, dashed-dot for visibility
xline(55.2, 'k:', 'LineWidth', 2); % Black, dotted for distinction
yline(mean(abs(vel_smooth(390:1045))), ':', 'LineWidth', 2, 'Color', [0.4660, 0.6740, 0.1880]); % Green
yline(mean(abs(vel_smooth(1120:end))), '-.', 'LineWidth', 2, 'Color', [0.8500, 0.3250, 0.0980]); % Orange
grid on
grid(gca,'minor')
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Velocity (ft./s)',FontSize=16)
title('Huntsville Competition Flight Velocity vs. Time',FontSize=16)
lgd = legend('Raw Data', 'Smoothed Data', 'Drogue Deployment', ...
             'Main Deployment', 'Average Drogue Velocity', 'Average Main Velocity', ...
             'FontSize', 16, 'Location', 'southoutside', 'Orientation', 'horizontal', 'NumColumns', 3);







