on_data = readmatrix('OR_power_on_2024.csv');
off_data = readmatrix('OR_power_off_2024.csv');

off_update = off_data(:,2).*0.85;
on_update = on_data(:,2).*0.85;

new_off = [off_data(:,1),off_update];
new_on = [on_data(:,1),on_update];

csvwrite('Power_on_VDF_corrected_2024.csv',new_on)
csvwrite('Power_off_VDF_corrected_2024.csv',new_off)