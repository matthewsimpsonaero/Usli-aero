%VDF Drag Processing 

data2 = readmatrix('dtl34.csv');
altitude2 = data2(:,3);
time2 = data2(:,1);
vel2 = data2(:,4);
vel_smooth2 = smoothdata(vel2,"sgolay");


minimum = 101; % select a good sample location
maximum = 150;
plot(time2(minimum :maximum),vel_smooth2(minimum:maximum))
coef = polyfit(time2(minimum :maximum),vel_smooth2(minimum :maximum),1);


a = diff(vel_smooth2(minimum:maximum))*20*0.3048 %m/s^2
a= -11.27
%plot(a)


F_decleration = a*22.008; % mass of rocket without prop
F_gravity = 22.008*-9.81;

F_drag = F_decleration - F_gravity;



vel = vel_smooth2(minimum:maximum-1)*0.3048; %m/s;
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