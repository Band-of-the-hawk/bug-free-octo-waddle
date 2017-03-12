%% Oppgave 4 - Population
clear;
clc;
fileID = fopen('log_files\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
rabbit = FD_data{1,1};
fox = FD_data{1,2};
wolf = FD_data{1,3};
figure('name','Populations');
plot(rabbit);
hold on;
plot(fox);
plot(wolf);
xlabel('Steps');
ylabel('Population');
hold off;
clear('fileID','FD_data');

% Estimer gjennomsnittlig tidsperiode for svingningene
% Antar den er på ca 1177 steps (30 + 2 halve svingniger delt på 36500
% steps totalt)

% Estimer standardavviket i denne tidsperioden
% Antar standardavviket er ca 200.