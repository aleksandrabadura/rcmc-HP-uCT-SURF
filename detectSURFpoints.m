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