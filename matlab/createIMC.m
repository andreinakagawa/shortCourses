%--------------------------------------------------------------------------
% FEDERAL UNIVERSITY OF UBERLANDIA
% Faculty of Electrical Engineering
% Biomedical Engineering Lab
% Uberlândia, Brazil
%--------------------------------------------------------------------------
% Developed by:
%   Andrei Nakagawa, MSc - andrei.ufu@gmail.com
%--------------------------------------------------------------------------
% Description: This script generates IMC values according to some specific
% criteria
%--------------------------------------------------------------------------
%Parameters
%Total number of volunteers
numbVolunteers = 150;
%Number of males
numbMale = 81;
%Number of females
numbFemale = numbVolunteers - numbMale;
%Minimum age
minAge = 17;
%Maximum age
maxAge = 30;

%Creates random values for age
age = round((maxAge-minAge).*rand(numbVolunteers,1)) + minAge;

%Creates random values for gender
gender = zeros(numbVolunteers,1);
gender(1:numbMale) = 0; %Male
gender(numbMale+1:numbVolunteers) = 1; %Female

%Creates random values for height
%Males
minMaleHeight = 1.66;
maxMaleHeight = 1.87;
maleHeight = (maxMaleHeight-minMaleHeight).*rand(numbMale,1) + minMaleHeight;
%Females
minFemaleHeight = 1.53;
maxFemaleHeight = 1.78;
femaleHeight = (maxFemaleHeight-minFemaleHeight).*rand(numbFemale,1) + minFemaleHeight;

%Adjust values to fit 2 decimal places
for i=1:numbMale
    maleHeight(i) = str2double(sprintf('%.2f',maleHeight(i)));    
end

%Adjust values to fit 2 decimal places
for i=1:numbFemale    
    femaleHeight(i) = str2double(sprintf('%.2f',femaleHeight(i)));
end

%Creates an array containing all the height values
height(1:numbMale) = maleHeight;
height(numbMale+1:numbVolunteers) = femaleHeight;
height = height';

%I will generate the weight based on the Body-Weight values (IMC, in
%portuguese)

%Create random IMC values
%In the population level of males
%Specifies the percentage of population
maleNumbSubWeight = round(0.09*numbMale);
maleNumbNormalWeight = round(0.72*numbMale);
maleNumbOverWeight = round(0.19*numbMale);
%In the population level of females
%Specifies the percentage of population
femaleNumbSubWeight = round(0.15*numbFemale);
femaleNumbNormalWeight = round(0.8*numbFemale);
femaleNumbOverWeight = round(0.05*numbFemale);

%IMC values
%Sub-Weight
minSW = 16; maxSW = 18.4;
%Normal weight 
minNW = 18.5; minOW = 25;
%Over weight
maxNW = 24.9; maxOW = 35;

%Male Weight
maleSW = (maxSW-minSW).*rand(maleNumbSubWeight,1) + minSW;
maleNW = (maxNW-minNW).*rand(maleNumbNormalWeight,1) + minNW;
maleOW = (maxOW-minOW).*rand(maleNumbOverWeight,1) + minOW;

maleIMC = zeros(numbMale,1);
maleIMC(1:maleNumbSubWeight) = maleSW;
maleIMC(maleNumbSubWeight+1:maleNumbSubWeight+maleNumbNormalWeight) = maleNW;
maleIMC(maleNumbSubWeight+maleNumbNormalWeight+1:maleNumbSubWeight+maleNumbNormalWeight+maleNumbOverWeight) = maleOW;
maleIMC = maleIMC(1:numbMale);
maleIMC(maleIMC == 0) = 23;

%Female Weight
femaleSW = (maxSW-minSW).*rand(femaleNumbSubWeight,1) + minSW;
femaleNW = (maxNW-minNW).*rand(femaleNumbNormalWeight,1) + minNW;
femaleOW = (maxOW-minOW).*rand(femaleNumbOverWeight,1) + minOW;
femaleIMC = zeros(numbFemale,1);
femaleIMC(1:femaleNumbSubWeight) = femaleSW;
femaleIMC(femaleNumbSubWeight+1:femaleNumbSubWeight+femaleNumbNormalWeight) = femaleNW;
femaleIMC(femaleNumbSubWeight+femaleNumbNormalWeight+1:femaleNumbSubWeight+femaleNumbNormalWeight+femaleNumbOverWeight) = femaleOW;
femaleIMC = femaleIMC(1:numbFemale);
femaleIMC(femaleIMC == 0) = 23;

%Permutates the values, to randomize the samples
xmale = randperm(numbMale);
xfemale = randperm(numbFemale);

maleIMC = maleIMC(xmale);
femaleIMC = femaleIMC(xfemale);

imc = zeros(numbVolunteers,1);
imc(1:numbMale) = maleIMC;
imc(numbMale+1:numbVolunteers) = femaleIMC;

database = zeros(numbVolunteers,4);
database(:,1) = age;
database(:,2) = gender;
database(:,3) = height;

for i=1:numbVolunteers
    weight = (database(i,3)^2) * imc(i);    
    database(i,4) = str2double(sprintf('%.2f',weight));
end

y = randperm(numbVolunteers);
database = database(y,:);

fileID = fopen('dadosIMC.txt','w');
for i=1:numbVolunteers
    fprintf(fileID,'%d\t%d\t%.2f\t%.2f\n',database(i,1),database(i,2),database(i,3),database(i,4));
end
fclose(fileID);