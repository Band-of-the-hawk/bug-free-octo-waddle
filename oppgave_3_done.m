%% Oppgave 2 
clear;
clc;
fileID = fopen('log_files_vinh\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
rabbit = FD_data{1,1};
fox = FD_data{1,2};
wolf = FD_data{1,3};

% Correlation Rabbit and Fox
figure('name','Rabbit vs Fox');
scatter(rabbit, fox,'.');
hold on;
xlabel('Rabbit');
ylabel('Fox');

r = double(rabbit);
f = double(fox);

rvfTemp = corrcoef(r,f);
rvf = rvfTemp(1,2);
clear('rvfTemp');
hold off;


% Correlation between Wolf and fox
figure('name', 'Fox vs Wolf');
scatter(fox, wolf, '.');
hold on;
xlabel('Fox');
ylabel('Wolf');
hold off
clear('fileID','FD_data');

w = double(wolf);

fvwTemp = corrcoef(f,w);
fvw = fvwTemp(1,2);
clear('fvwTemp');
hold off