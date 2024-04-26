data_rp = readmatrix('PDF_data (1) (1).csv');


data = readmatrix('dtl49.csv');
altitude = data(:,2);
time = data(:,1);
vel = data(:,4);
vel_smooth = smoothdata(vel,"sgolay");

time_rp = data_rp(:,1);
altitude_rp = (data_rp(:,4)-8.772864)*3.28084;
velocity_rp = sqrt(data_rp(:,5).^2+data_rp(:,6).^2+data_rp(:,7).^2)*3.28084;
accel_rp = sqrt(data_rp(:,8).^2+data_rp(:,9).^2+data_rp(:,10).^2)*3.28084;

data2 = readmatrix('dtl34.csv');
altitude2 = data2(:,3);
time2 = data2(:,1);
vel2 = data2(:,4);
vel_smooth2 = smoothdata(vel2,"sgolay");

fig = figure();
fig.Position = [100 100 800 700];
plot(time2,altitude2,'m','LineWidth',2)
hold on
plot(time,altitude,'g','LineWidth',2)
plot(time_rp,altitude_rp,'b','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)',fontsize=16)
ylabel('Altitude (Ft.)',fontsize=16)
title("VDF Launch Altitude Vs. Time Comparison",fontsize=16)
legend('Inital VDF','VDF Reflight','RocketPy')
ylim([0,4300])

fig = figure();
fig.Position = [100 100 800 700];
plot(time2,abs(vel_smooth2),'g','LineWidth',2)
hold on
plot(time,abs(vel_smooth),'m','LineWidth',2)
plot(time_rp,velocity_rp,'b','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)',fontsize=16)
ylabel('Velocity (Ft/s)',fontsize=16)
title("VDF Launch Velocity Magnitude Vs. Time Comparison",fontsize=16)
legend('Inital VDF','VDF Reflight','RocketPy')
xlim([0,max(time)])