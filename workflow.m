close all; 
clear all; 
clc; 
%%

c=49;                   % numer próbki (47-49 demo)
flip = false;           % odbicie 
rot = 0;                % rotacja (0-360)

switch c
    case 47:49
        load_histpat;
end

cases; 
segment_hist;
segment_uCT;
register_ICP;

