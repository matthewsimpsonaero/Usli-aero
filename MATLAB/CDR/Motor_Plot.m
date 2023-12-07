% Matthew Simpson
% Motor Data Plot

motorData = readmatrix('AeroTech_L1390G.csv');

fig = figure();
fig.Position = [100,100,800,600];
plot(motorData(:,1),motorData(:,2)*0.224809,'r-o',LineWidth=2)
grid on 
grid minor
xlabel('Time (s)')
ylabel('Force (lbf.)')
title('AeroTech L1390G Thrust Profile')
yline(312.4844,'g',LineWidth=2)
legend('Thrust Force','Average Thrust')