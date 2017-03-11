%% Oppgave 2 - Innhenting av data
clear;
clc;

% Åpner og henter ut data fra rabbit-log-file.csv
fileID = fopen('log_files\rabbit-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
rabbitInfo = FD_data{1,1};
rabbitInfo = [ rabbitInfo FD_data{1,2} ];
%rabbitAge = rabbitInfo(:,1);
%rabbitStep = rabbitInfo(:,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra fox-log-file.csv
fileID = fopen('log_files\fox-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
foxInfo = FD_data{1,1};
foxInfo = [ foxInfo FD_data{1,2} ];
%foxAge = foxInfo(:,1);
%foxStep = foxInfo(:,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra wolf-log-file.csv
fileID = fopen('log_files\wolf-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
wolfInfo = FD_data{1,1};
wolfInfo = [ wolfInfo FD_data{1,2} ];
%wolfAge = wolfInfo(:,1);
%wolfStep = wolfInfo(:,2);
clear('fileID','FD_data');

% Åpner og henter ut data fra population-log-file.csv
fileID = fopen('log_files\population-log-file.csv');
FD_data = textscan(fileID,'%d%d%d','Delimiter', ',');
fclose(fileID);
popInfo = FD_data{1,1};
popInfo = [ popInfo FD_data{1,2} ];
popInfo = [ popInfo FD_data{1,3} ];
rabbitPop = popInfo(:,1);
foxPop = popInfo(:,2);
wolfPop = popInfo(:,3);
clear('fileID','FD_data');

%% Oppgave 2 - Finner gjennomsnittsalder for hvert step
%Kanin
rabbitSize = size(rabbitInfo);
rabbitSize = rabbitSize(1);
rabbitAvgAge = zeros();
step = 1;
rabbitAvgStep = zeros();
for i = 1:rabbitSize
    if rabbitInfo(i,2)==step
        rabbitAvgStep = [ rabbitAvgStep rabbitInfo(i,1) ];
    else
        step = step + 1;
        rabbitAvgAge = [ rabbitAvgAge mean(rabbitAvgStep) ];
        rabbitAvgStep = zeros();
    end
end
clear('step','i');
rabbitAvgAge = rabbitAvgAge';

%Rev
foxSize = size(foxInfo);
foxSize = foxSize(1);
foxAvgAge = zeros();
step = 1;
foxAvgStep = zeros();
for i = 1:foxSize
    if foxInfo(i,2)==step
        foxAvgStep = [ foxAvgStep foxInfo(i,1) ];
    else
        step = step + 1;
        foxAvgAge = [ foxAvgAge mean(foxAvgStep) ];
        foxAvgStep = zeros();
    end
end
clear('step','i');
foxAvgAge = foxAvgAge';

%Ulv
wolfSize = size(wolfInfo);
wolfSize = wolfSize(1);
wolfAvgAge = zeros();
step = 1;
wolfAvgStep = zeros();
for i = 1:wolfSize
    if wolfInfo(i,2)==step
        wolfAvgStep = [ wolfAvgStep wolfInfo(i,1) ];
    else
        step = step + 1;
        wolfAvgAge = [ wolfAvgAge mean(wolfAvgStep) ];
        wolfAvgStep = zeros();
    end
end
clear('step','i');
wolfAvgAge = wolfAvgAge';

%% Oppgave 2 - Besvarelse: Regn	ut korrelasjonen mellom
% a) levealder	til	rovdyrene og antallet rovdyr som er	tilstede
% Ulv snittalder vs antall

figure('name','Levealder vs antall for ulv');
scatter(wolfAvgAge, wolfPop,'.');
hold on;
xlabel('Gj.snittalder');
ylabel('Antall ulv');
waa = double(wolfAvgAge);
wp = double(wolfPop);
waaVwpTemp = corrcoef(waa,wp);
waaVwp = waaVwpTemp(1,2);
clear('waaVwpTemp','waa','wp');
hold off;

% Rev snittalder vs antall

figure('name','Levelader vs antall for rev');
scatter(foxAvgAge, foxPop,'.');
hold on;
xlabel('Gj.snittalder');
ylabel('Antall rev');
faa = double(foxAvgAge);
fp = double(foxPop);
faaVfpTemp = corrcoef(faa,fp);
faaVfp = faaVfpTemp(1,2);
clear('faaVfpTemp','faa','fp');
hold off;

% b) levealder til rovdyrene og	antallet byttedyr som er tilstede
% Ulv snittalder vs antall rever

figure('name','Levelader for ulv vs antall rever');
scatter(wolfAvgAge, foxPop,'.');
hold on;
xlabel('Gj.snittalder ulv');
ylabel('Antall rev');
waa = double(wolfAvgAge);
fp = double(foxPop);
waaVfpTemp = corrcoef(waa,fp);
waaVfp = waaVfpTemp(1,2);
clear('waaVfpTemp','waa','fp');
hold off;

% Rev snittalder vs antall kaniner

figure('name','Levelader for rev vs antall kaniner');
scatter(foxAvgAge, rabbitPop,'.');
hold on;
xlabel('Gj.snittalder rev');
ylabel('Antall kaniner');
faa = double(foxAvgAge);
rp = double(rabbitPop);
faaVrpTemp = corrcoef(faa,rp);
faaVrp = faaVrpTemp(1,2);
clear('faaVrpTemp','faa','rp');
hold off;

% c) levealder til byttedyrene og antallet rovdyr som er tilstede
% Kanin snittalder vs antall rever

figure('name','Levelader kanin vs antall rever');
scatter(rabbitAvgAge, foxPop,'.');
hold on;
xlabel('Gj.snittalder kanin');
ylabel('Antall rev');
raa = double(rabbitAvgAge);
fp = double(foxPop);
raaVfpTemp = corrcoef(raa,fp);
raaVfp = raaVfpTemp(1,2);
clear('raaVfpTemp','raa','fp');
hold off;

% Rev snittalder vs antall ulver

figure('name','Levelader rev vs antall ulver');
scatter(foxAvgAge, wolfPop,'.');
hold on;
xlabel('Gj.snittalder rev');
ylabel('Antall ulv');
faa = double(foxAvgAge);
wp = double(wolfPop);
faaVwpTemp = corrcoef(faa,wp);
faaVwp = faaVwpTemp(1,2);
clear('faaVwpTemp','faa','wp');
hold off;

% d) levealder til byttedyrene og antallet byttedyr	som	er tilstede
% Kanin snittalder vs antall kaniner

figure('name','Levelader kanin vs antall kaniner');
scatter(rabbitAvgAge, rabbitPop,'.');
hold on;
xlabel('Gj.snittalder kanin');
ylabel('Antall kanin');
raa = double(rabbitAvgAge);
rp = double(rabbitPop);
raaVrpTemp = corrcoef(raa,rp);
raaVrp = raaVrpTemp(1,2);
clear('raaVrpTemp','raa','rp');
hold off;














