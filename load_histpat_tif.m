% Crop HP tif image (if histpat image is already .tif; this is alternative function to load_histpat.m)
[filename, pathname] = uigetfile( ...
    {'*.tif*', 'All Image Files (*.tif*)';
    '*.tif*','TIFF images (*.tif, *.tiff)'}, ...
    'Pick Image');
fname=[pathname filename];

hp_image = imread(fname);
figure
imshow(hp_image);

impixelinfo
axis('on', 'image')
uiwait(helpdlg('Draw a box'));
roi = drawrectangle;
pos = get(roi, 'Position');
pos=round(pos);
croppedImage = hp_image(pos(2):pos(2)+pos(4), pos(1):pos(1)+pos(3), :);

imwrite(croppedImage,sprintf('%s_%d_%d_%d_%d.tif',fname(1:end-5),pos(1),pos(2),pos(3),pos(4)));