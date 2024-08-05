%% segmentacja obrazu histopatologicznego
% konwersja przestrzeni barw RGB --> HSV
% progowanie saturacji <0.08; 0.20>
% wybór najwiekszego obiektu
% zalanie dziur

%%

% Convert RGB image to HSV
	hsvImage = rgb2hsv(io_roi);
	% Extract out the H, S, and V images individually
	hImage = hsvImage(:,:,1);
	sImage = hsvImage(:,:,2);
	vImage = hsvImage(:,:,3);
	
	% % Display the hue image.
	% subplot(1, 3, 1);
	% h1 = imshow(hImage);
	% title('Hue Image', 'FontSize', fontSize);
	% % Set up an infor panel so you can mouse around and inspect the hue values.
	% hHuePI = impixelinfo(h1);
	% set(hHuePI, 'Units', 'Normalized', 'Position',[.34 .69 .15 .02]);
    % 
	% % Display the saturation image.
	% h2 = subplot(1, 3, 2);
	% imshow(sImage);
	% title('Saturation Image', 'FontSize', fontSize);
	% % Set up an infor panel so you can mouse around and inspect the saturation values.
	% hSatPI = impixelinfo(h2);
	% set(hSatPI, 'Units', 'Normalized', 'Position',[.54 .69 .15 .02]);
    % 
	% % Display the value image.
	% h3 = subplot(1, 3, 3);
	% imshow(vImage);
	% title('Value Image', 'FontSize', fontSize);
	% % Set up an infor panel so you can mouse around and inspect the value values.
	% hValuePI = impixelinfo(h3);
	% set(hValuePI, 'Units', 'Normalized', 'Position',[.75 .69 .15 .02]);


    bw = sImage > 0.08 & sImage < 0.2;
    figure(1);
    subplot(2,3,2);
    imshow(bw,[]);

    bw2 = bwareafilt(bw, 1); % Extract largest blob.
    bw2=imfill(bw2,'holes');
    imMask = insertObjectMask(io_roi,bw2);
    figure(1);
    subplot(2,3,3);
    imshow(imMask);