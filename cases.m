%% wybór próbki 
% c - numer próbki (demo: 47-49)

% wczytaj .tif (histpat)
% wczytaj .tif (uCT)
% wybierz punkt obiektu na uCT
% wybierz punkt tła na uCT

switch c

    case 47

        % io_roi = imread('C:\ABM\Dane\histpat\histpat\transza1\7824_47_4_884.792325_7494.200000.tif');
        io_roi = imread('C:\ABM\Dane\histpat\histpat\transza1\7824_47_4_1515.902935_3431.750000.tif');
        
        uCT_o = imread('C:\ABM\Dane\uCT\7824-47-wezly\slice_0370.tif');
        
        foregroundPoints = [726	    1614];
        backgroundPoints = [1072	1554];

    case 48 

        io_roi = imread('C:\ABM\Dane\histpat\histpat\transza1\7824_48_4_809.854833_304.968401.tif');
        uCT_o = imread('C:\ABM\Dane\uCT\7824-48-49-wezly\slice_0743.tif');

        foregroundPoints = [1453,1192];
        backgroundPoints = [1668,956];
        

    case 49
        io_roi = imread('C:\ABM\Dane\histpat\histpat\transza1\7824_49_4_24.889898_5121.031771.tif');
        uCT_o = imread('C:\ABM\Dane\uCT\7824-48-49-wezly\slice_0698.tif');

        foregroundPoints = [1694,1675];
        backgroundPoints = [1589,1407];

    otherwise

[file,location] = uigetfile('*.tif'); % HP
io_roi = imread(fullfile(location,file));

[file,location] = uigetfile('*.tif'); % uCT
uCT_o = imread(fullfile(location,file));


figure(99);
imshow(uCT_o,[]);

p=ginput(2);

close (99);

foregroundPoints = round(p(1,:));
backgroundPoints = round(p(2:end,:));



end

uCT = uCT_o;

figure(1);
subplot(2,3,1);
imshow(io_roi,[]);

subplot(2,3,4);
imshow(uCT,[]);
