%% Oppgave 2
clear;
clc;

% Åpner og henter ut data fra rabbit-log-file.csv
fileID = fopen('log_files\rabbit-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
rabbitAge = FD_data{1,1};
rabbitStep = FD_data{1,2};
clear('fileID','FD_data');

% Åpner og henter ut data fra fox-log-file.csv
fileID = fopen('log_files\fox-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
foxAge = FD_data{1,1};
foxStep = FD_data{1,2};
foxInfo = FD_data{1,1};
foxInfo = [ foxInfo FD_data{1,2} ];
clear('fileID','FD_data');

%foxInfo(:,{'Age','Step'})

%asdf = foxInfo(foxInfo{1,2}==4)

foxSize = size(foxInfo);
foxSize = foxSize(1);

% Åpner og henter ut data fra wolf-log-file.csv
fileID = fopen('log_files\wolf-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
wolfAge = FD_data{1,1};
wolfStep = FD_data{1,2};
clear('fileID','FD_data');

% Åpner og henter ut data fra population-log-file.csv
fileID = fopen('log_files\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
rabbitPop = FD_data{1,1};
foxPop = FD_data{1,2};
wolfPop = FD_data{1,3};
clear('fileID','FD_data');