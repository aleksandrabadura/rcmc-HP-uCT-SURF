close all; 
clear all; 
clc; 
%%

c=49;                   % Numer próbki (47-49 demo)

switch c
    case 47:49
        load_histpat;
end

% Przeskalowanie obrazu uCT do rozmiaru obrazu HP: 'uCT2HP'
% Przeskalowanie obrazu HP do rozmiaru obrazu uCT: 'HP2uCT'
resize = 'uCT2HP'; %

cases; 
detectSURFpoints;


