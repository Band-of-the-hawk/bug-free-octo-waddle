%% Oppgave 2
clear;
clc;

% Åpner og henter ut data fra rabbit-log-file.csv
fileID = fopen('log_files\rabbit-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
rabbitInfo = FD_data{1,1};
rabbitInfo = [ rabbitInfo FD_data{1,2} ];
rabbitAge = rabbitInfo(1,1);
rabbitStep = rabbitInfo(1,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra fox-log-file.csv
fileID = fopen('log_files\fox-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
foxInfo = FD_data{1,1};
foxInfo = [ foxInfo FD_data{1,2} ];
foxAge = foxInfo(:,1);
foxStep = foxInfo(:,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra wolf-log-file.csv
fileID = fopen('log_files\wolf-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
wolfInfo = FD_data{1,1};
wolfInfo = [ wolfInfo FD_data{1,2} ];
wolfAge = wolfInfo(1,1);
wolfStep = wolfInfo(1,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra population-log-file.csv
fileID = fopen('log_files\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
popInfo = FD_data{1,1};
popInfo = [ popInfo FD_data{1,2} ];
popInfo = [ popInfo FD_data{1,3} ];
rabbitPop = popInfo(1,1);
foxPop = popInfo(1,2);
wolfPop = popInfo(1,3);
clear('fileID','FD_data');

% Lat eksperimenteringa byrje!


foxSize = size(foxInfo);
foxSize = foxSize(1);
foxAvgAge = zeros();
for 1 = 0:foxSize
    foxAvgStep = zeros();
    foxThisStep = 1;
    if
end