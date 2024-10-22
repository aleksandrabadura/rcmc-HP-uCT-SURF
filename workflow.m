close all; 
clear all; 
clc; 
%%

c=50;                   % Numer próbki (47-49 demo) węzły
                        % 50 jelito

% switch c
%     case 47
%         load_histpat;
%     case 50
%         load_histpat_tif;
% end

% Przeskalowanie obrazu uCT do rozmiaru obrazu HP: 'uCT2HP'
% Przeskalowanie obrazu HP do rozmiaru obrazu uCT: 'HP2uCT'
resize = 'HP2uCT'; %

cases; 
preprocess;
rigidRegistration;
% detectSURFpoints;


