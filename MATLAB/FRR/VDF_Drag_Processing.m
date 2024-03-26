%% VDF Drag Processing 

data = readmatrix('VDF_Flight_Data.csv');
altitude = data(:,2);
time = data(:,1);
vel = data(:,4);

altitude_smooth = smoothdata(altitude,"sgolay",9);
vel_smooth = smoothdata(vel,"sgolay");

data2 = readmatrix('dtl34.csv');
altitude2 = data2(:,3);
time2 = data2(:,1);
vel2 = data2(:,4);
vel_smooth2 = smoothdata(vel2,"sgolay");


data_rp = readmatrix('Data (13).csv');

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
title("VDF Altitude Vs. Time Comparison")
legend('Altimeter Data','RocketPy Prediction')
xlim([0,max(time)])

fig = figure();
fig.Position = [100 100 800 700];
plot(time2,abs(vel_smooth2),'b','LineWidth',2)
hold on
plot(time_rp,abs(velocity_rp),'r','LineWidth',2)
grid on 
grid minor
xlabel('Time Since Launch (s)')
ylabel('Velocity (Ft/s)')
title("VDF Launch Velocity Magnitude Vs. Time Comparison")
legend('Altimeter Data','RocketPy Prediction')
xlim([0,max(time)])
grid on

%%
fig = figure();
fig.Position = [100 100 800 700];

smoothdata(altitude,"sgolay",9);
plot(time(132:345),smoothdata(diff(abs(vel_smooth(132:346))),"sgolay")*20,'r','LineWidth',2)
hold on
%plot(time_rp,velocity_rp,'b','LineWidth',2)
grid on 
grid minor
xlabel('Acent Time (s)')
ylabel('Acceleration (Ft/s^2)')
title("Subscale Launch Acceleration Magnitude Vs. Time Comparison")
%legend('Altimeter','RocketPy')
grid on




%%
minimum = 205; % select a good sample location
maximum = 225;
plot(time(minimum :maximum),vel_smooth(minimum:maximum))
coef = polyfit(time(minimum :maximum),vel_smooth(minimum :maximum),1);


a = diff(vel_smooth(minimum:maximum))*20*0.3048; %m/s^2

plot(a)


F_decleration = a*20.897; % mass of rocket without prop
F_gravity = 20.897*-9.81;

F_drag = F_decleration - F_gravity;



vel = vel_smooth(minimum:maximum-1)*0.3048; %m/s;
rho = 1.225;
A =0.01929028;

Cd = mean(-F_drag)./(.5.*rho.*mean(vel).^2.*A);


% % Calculate the absolute differences
% differences = abs(Cd - target);
% 
% minDifference = min(differences);
% 
% % Find the index of the minimum difference
% minIndex = find(differences == minDifference, 1);
% 
% % Find the value in the set that is closest to the target
% closestValue = Cd(minIndex);
% 
% % Display the result
% fprintf('The value closest to %.2f in the set is %.2f.\n', target, closestValue);