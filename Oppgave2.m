%% Oppgave 2 
clear;
clc;
fileID = fopen('log_files\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
rabbit = FD_data{1,1};
fox = FD_data{1,2};
wolf = FD_data{1,3};
figure('name','Rabbit vs Fox');
scatter(rabbit, fox,'.');
hold on;
xlabel('Rabbit');
ylabel('Fox');
hold off;
r = double(rabbit);
f = double(fox);
w = double(wolf);

rvf = corrcoef(r,f);
fvw = corrcoef(f,w);

figure('name', 'Fox vs Wolf');
scatter(fox, wolf, '.');
hold on;
xlabel('Fox');
ylabel('Wolf');
hold off
clear('fileID','FD_data');