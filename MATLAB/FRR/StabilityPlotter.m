% Matthew Simpson
% Stability Plotter
close all
data = readmatrix('OpenRocketStability.csv');

time = data(:,1);
CP = data(:,3);
CG = data(:,4);
Stab = data(:,6);

fig = figure();
fig.Position = [100,100,800,600];
yyaxis left; % activates the left y-axis
plot(time, Stab, 'b-',LineWidth=2); 
ylabel('Stability (cal)')
xlabel('Time (s)')
grid on 
grid minor

yyaxis right; % activates the right y-axis
plot(time, CP, 'g-',LineWidth=2); 
hold on 
plot(time, CG,'-',LineWidth=2,Color=[1 .5 0]); 
ylabel('Distance From Nose Cone (in.)')
title('Stability Margin of Full Scale Launch Vehcile')
xline(2.2,'k--')
legend('Stability', 'CP','CG','Motor Burnout',Location='southoutside',Orientation='horizontal')

