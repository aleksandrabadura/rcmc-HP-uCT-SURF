%% segmentacja obrazu uCT
% normalizacja <0;255>
% import AnythingModel
% segmentacja
% zalanie dziur 

%%
%% segmentation uCT
uCT_n=uCT_o-min(uCT_o(:));
uCT_n=double(uCT_n);
uCT_n=uCT_n/max(uCT_n(:));
uCT_n=uCT_n*255;

% uCT=uCT-4450;
% uCT=abs(uCT);

sam = segmentAnythingModel;
embeddings = extractEmbeddings(sam,uCT_n);




masks = segmentObjectsFromEmbeddings(sam,embeddings,size(uCT),ForegroundPoints=foregroundPoints, ...
                                              BackgroundPoints=backgroundPoints);

masks = bwareafilt(masks, 1); % Extract largest blob.
masks=imfill(masks,'holes');
uCT_n=uint8(uCT_n);
imMask = insertObjectMask(uCT_n,masks);

figure(1);
subplot(2,3,4);

fx = foregroundPoints(:,1);
fy = foregroundPoints(:,2);
bx = backgroundPoints(:,1);
by = backgroundPoints(:,2);
hold on
plot(fx,fy,'g*',bx,by,'r*')
hold off


figure(1);
subplot(2,3,5);
imshow(masks,[]);

figure(1);
subplot(2,3,6);
imshow(imMask,[]);

