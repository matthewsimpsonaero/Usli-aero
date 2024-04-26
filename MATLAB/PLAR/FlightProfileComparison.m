% Matthew Simpson
% Apogee Plotter
clc;clear;close all

data = readmatrix('FRRSIM.csv');
datareal = readmatrix('HuntsvilleFlight.csv');
nightbefore = readmatrix('Launch Data.csv');

time  = data(:,1);
altitude = (data(:,4)*3.28084)-816.392+566;
velocity_FRR = sqrt(data(:,5).^2+data(:,6).^2+data(:,7).^2)*3.28084;

time_real = datareal(:,1);
altitude_real = datareal(:,2);
velocity_real = datareal(:,4);
vel_smooth = smoothdata(velocity_real,"sgolay");

timeNightBefore = nightbefore(:,1);
altitudeNightBefore = (nightbefore(:,4)-248.83)*3.28084;
velocity_Huntsville = sqrt(nightbefore(:,5).^2+nightbefore(:,6).^2+nightbefore(:,7).^2)*3.28084;

%%

fig = figure();
fig.Position = [100 100 1040 600];
plot(time,altitude-567,'b-',LineWidth=2)
hold on
plot(timeNightBefore,altitudeNightBefore,'m',LineWidth=2)
plot(time_real,altitude_real,'g',LineWidth=2)
grid on 
grid minor
yline(4050,'k--',LineWidth=2)
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Altitude (ft.)',FontSize=16)
title("Huntsville Competition Flight Altitude Simulation Vs. Altimiter Data",FontSize=16)
legend('FRR Simulation','Huntsville Simulation','Altimiter Data','Declared Apogee',fontsize=16,Location="southoutside",Orientation='horizontal')
ylim([0 4700])

%%

fig = figure();
fig.Position = [100 100 940 600];

plot(time,velocity_FRR,'b-',LineWidth=2)
hold on
plot(timeNightBefore,velocity_Huntsville,'m',LineWidth=2)
plot(time_real,abs(vel_smooth),'g',LineWidth=2)
grid on 
grid minor
xlabel('Time Since Launch (s)',FontSize=16)
ylabel('Velocity (ft./s)',FontSize=16)
title("Huntsville Competition Flight Velocity Simulation Vs. Altimiter Data",FontSize=16)
legend('FRR Simulation','Huntsville Simulation','Altimiter Data',fontsize=16,Location="southoutside",Orientation='horizontal')
