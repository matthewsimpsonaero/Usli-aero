% Matthew Simpson
% Subscale Data Processing
close all

data = readmatrix('dtl49.csv');
altitude = data(:,2);
time = data(:,1);
vel = data(:,4);

vel_smooth = smoothdata(vel,"sgolay");

fig = figure();
fig.Position = [100 100 800 700];
plot(time,altitude,'g','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Altitude (Ft.)',FontSize=16)
title("Launch Altitude Vs. Time Comparison",FontSize=16)
xline(15.9,'b--',Linewidth=2)
legend('Altitude','Apogee')

%% Velocity Plot

vel_smooth = smoothdata(vel,"sgolay");

fig = figure();
fig.Position = [100 100 800 700];
plot(time,vel_smooth,'m','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Velocity (Ft/S.)',FontSize=16)
yline(0,'k-',linewidth=1)
title("Launch Velocity Vs. Time Comparison",FontSize=16)

Drogue_Velocity = mean(vel(363:393))
Main_Velocity = mean(vel(427:484))

