% Matthew Simpson
% Motor Data Plot

motorData = readmatrix('AeroTech_L1940X.csv');

fig = figure();
fig.Position = [100,100,800,600];
plot(motorData(:,1),motorData(:,2)*0.224809,'r-o',LineWidth=2)
grid on 
grid minor
xlabel('Time (s)')
ylabel('Force (lbf.)')
title('AeroTech L1940X Thrust Profile')
yline(435.9,'g',LineWidth=2)
legend('Thrust Force','Average Thrust')

%% Thrust to weight Measurement

TWR = readmatrix('Thrust_weight_Data.csv');

inital_weight = 45.74+4;
times = motorData(:,1);
weight = -1.7427.*times +49.74;

fig2 = figure();
fig2.Position = [100,100,800,600];
plot(times,(motorData(:,2)*0.224809)./weight,'b-o',LineWidth=2)
hold on
plot(TWR(:,1),TWR(:,3)./TWR(:,2),'g-o',LineWidth=2)
grid on 
grid minor
xlabel('Time (s)')
ylabel('Thrust To Weight Ratio')
title('Thrust to Weight Ratio of Full Scale Launch Vehicle')
legend('Hand Calculation','RocketPy')