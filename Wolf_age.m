%% Oppgave 1 - Wolf
clear;
clc;
fileID = fopen('log_files\wolf-log-file.csv');
FD_data = textscan(fileID,'%d%d%s','Delimiter', ',');
fclose(fileID);
age = FD_data{1,1};
figure('name','Ulv Levealder');
histogram(age,1200);
hold on;
xlabel('Alder');
ylabel('Døde');
legend('Levealder ulver');
hold off;
clear('fileID','FD_data');

%% Estimert levealder.
    %Leveralder på rever ser ut som ligger en plass mellom 20 og 35.
%% Estimert feilmargin på levealder.
    %Feilmarginen kan se ut som ligger en plass rundt 35.
%% Punktestimat for avg. levealder Ulv.
n = size(age,(1:1));
sumAge = sum(age);
avgAge = sumAge/n;
clear('sumAge', 'sizeAge');
%% Standardavvik for avg. levealder Ulv.
xi = zeros(n,1);
it = 0;
for i = 1:n
    xi(i,1) = age(i,1)-avgAge;
    it = it + xi(i,1)^2;
end
s2 = (1/(n-1))*it;
clear('it', 'xi','i');
s2 = double(s2);
s = sqrt(s2);
clear('s2');
%Matlab Standardavvik for avg.
age2 = double(age);
st2 = std(age2);

%% 99% konfidensintervall for gjennomsnittlig levealder. Anta standardfordelt.
% 95% konfidens intervall -> alpha = 0.01 -> alpha/2 = 0.005 -> z = 2.58
% (tabell).
% xLower = x_snitt - z * std/sqrt(n)
z = 2.58;
xLower = avgAge - (z*(s/sqrt(n)));
xUpper = avgAge + (z*(s/sqrt(n)));
