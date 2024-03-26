M = readmatrix('aa.csv')

tt = 0:10:350;

plot(tt,M)


fig = figure();
fig.Position = [100,100,800,600];
plot(tt,M,'g-',LineWidth=2)
grid on 
grid minor
xlabel('Launch Azimuth (°)')
ylabel('Altitude (ft.)')
title("VDF Rocketpy Altitude vs. Azimuth Angle Analysis")