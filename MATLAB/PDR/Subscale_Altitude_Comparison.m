%Matthew Simpson
clc; clear; close 'all';

% Define the paths to the two CSV files
cd('..');
path = pwd;
folder1 = '\OpenRocket\';
folder2 = '\RASAero\';

% Define the file names within the folders
file1 = 'SubScale_Launch.csv';
file2 = 'Launch.CSV';

% Construct the full file paths
fullPath1 = [path,folder1,file1];
fullPath2 = [path,folder2,file2];

% Read the CSV files into variables
data1 = readmatrix(fullPath1); % Assuming a numeric CSV
data2 = readmatrix(fullPath2); % Assuming a numeric CSV

% Extract the two columns from each dataset
OR_time = data1(:, 1);
OR_Alt= data1(:, 2)*3.28084;

RA_time = data2(:, 1);
RA_alt = data2(:, 23);

fig = figure();
fig.Position = [100 100 740 600];
plot(OR_time,OR_Alt,'r-',LineWidth=3)
hold on
plot(RA_time,RA_alt,'g-',LineWidth=3)
grid on
grid(gca,'minor')
xlabel('Time (S)')
ylabel('Altitude (ft.)')
title('Flight Simulation Comparison')
legend('Open Rocket','RASAero II')
saveas(fig,fullfile([pwd,'/MATLAB'], 'Altitude_plot'), 'png') %saving as PNG