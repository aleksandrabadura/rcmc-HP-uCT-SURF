%% wybór próbki 
% c - numer próbki (demo: 47-49)

% wczytaj .tif (histpat)
% wczytaj .tif (uCT)

switch c

    case 47

        io_roi = imread('D:\AB\ABM\DANE\wezly\histpat\transza1\7824_47_4_2481.130926_4142.833333.tif');   
        uCT_o = imread('D:\AB\ABM\DANE\wezly\uCT\7824-47-wezly\slice_0370.tif');

    case 48 

        io_roi = imread('D:\AB\ABM\DANE\wezly\histpat\transza1\7824_48_4_1912.325792_2471.259375.tif');
        uCT_o = imread('D:\AB\ABM\DANE\wezly\uCT\7824-48-49-wezly\slice_0743.tif');

    case 49

        io_roi = imread('D:\AB\ABM\DANE\wezly\histpat\transza1\7824_49_5_449.409762_1315.706250.tif');
        uCT_o = imread('D:\AB\ABM\DANE\wezly\uCT\7824-48-49-wezly\slice_0698.tif');

    case 50
        io_roi = imread('D:\AB\ABM\DANE\jelito_BP\histpat\1M02_tiff\1M02-level-3_648_13887_20927_22079.tif');
        uCT_o = imread('D:\AB\ABM\DANE\jelito_BP\uCT\1M02\slice_0650.tif');

    otherwise

        [file,location] = uigetfile('*.tif'); % HP
        io_roi = imread(fullfile(location,file));
        
        [file,location] = uigetfile('*.tif'); % uCT
        uCT_o = imread(fullfile(location,file));
        
        
        figure(99);
        imshow(uCT_o,[]);
        
        p=ginput(2);
        
        close (99);

end

uCT = uCT_o;
