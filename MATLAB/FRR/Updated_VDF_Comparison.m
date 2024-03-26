% Matthew Simpson
% Apogee Plotter

data = readmatrix('UpdatedVDFPrediction.csv');
datareal = readmatrix('VDF_Flight_Data.csv');

time  = data(:,1);
altitude = (data(:,4)*3.28084);

fig = figure();
fig.Position = [100,100,800,600];
plot(time,altitude,'g-',LineWidth=2)
hold on
plot(datareal(:,1),datareal(:,2))
grid on 
grid minor
xlabel('Time (s)')
ylabel('Altitude (ft.)')
title("VDF Rocketpy Altitude Analysis")
[val,idx] = max(altitude);
xline(time(idx),'b--',LineWidth=2)
legend('Flight Profile','Apogee')
ylim([0 4400])