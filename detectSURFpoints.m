%% Preprocessing
% HISTPAT
% adjust image intensity
io_roi_gray = imadjust(rgb2gray(io_roi));
figure
imshow(io_roi_gray,[]);

% uCT
% normalization
uCT_n=double(uCT);
uCT_n=uCT_n-min(uCT_n(:));
uCT_n = uCT_n/(max(uCT_n(:)));
% adjust image intensity
switch c
    case 47
        J = imadjust(uCT_n,[0.63 0.87],[]);
        J = fliplr(J);
    case 48
        J = imadjust(uCT_n,[0.53 0.726],[]);
        J = flipud(J);
        J = imrotate(J,100);
    case 49
        J = imadjust(uCT_n,[0.14 0.21]);
        J = imrotate(J,-90);
end
figure
imshow(J);

%% Select corresponding uCT ROI
impixelinfo
axis('on', 'image')
uiwait(helpdlg('Draw a box'));
roi = drawrectangle;
pos = get(roi, 'Position');
pos=round(pos);
croppedImage = J(pos(2):pos(2)+pos(4), pos(1):pos(1)+pos(3));

%% Resize
if(strcmp(resize,'uCT2HP'))
    croppedImage = imresize(croppedImage,size(io_roi,1)/size(croppedImage,1)); % adjust uCT image size to histpat image
elseif(strcmp(resize,'HP2uCT'))
    io_roi_gray = imresize(io_roi_gray,size(croppedImage,1)/size(io_roi_gray,1)); % adjust histpat image size to uCT image
end

%% Detect SURF points
points_h = detectSURFFeatures(io_roi_gray);
points_uCT = detectSURFFeatures(croppedImage);

figure
imshow(io_roi_gray); hold on;
plot(points_h.selectStrongest(100));

figure
imshow(croppedImage); hold on;
plot(points_uCT.selectStrongest(100));

%% Extract features
[f1,vpts1] = extractFeatures(io_roi_gray,points_h); % histpat
[f2,vpts2] = extractFeatures(croppedImage,points_uCT); % uCT

% Get locations of matched points
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

% Display
figure
showMatchedFeatures(io_roi_gray,croppedImage,matchedPoints1,matchedPoints2,"montag");