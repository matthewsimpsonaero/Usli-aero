data = readmatrix('ThrustToWeight.csv')


plot(data(:,3)/((data(:,2))*9.81))

x =data(:,3)./((data(:,2))*9.81)
mean(data(:,3)./((data(:,2))*9.81))