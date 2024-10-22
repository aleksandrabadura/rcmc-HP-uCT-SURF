% Add OpenSlide library path
close all
folder = fileparts(which("mrxs_load.m"));
addpath(genpath(folder));

% Get path of the file
path = 'D:\AB\ABM\DANE\jelito_BP\histpat\1M02.mrxs';

% Load openslide library
openslide_load_library();

% Open whole-slide image
slidePtr = openslide_open(path);

% Get whole-slide image properties
[mppX, mppY, width, height, numberOfLevels, ...
    downsampleFactors, objectivePower] = openslide_get_slide_properties(slidePtr);

% Display properties
disp(['mppX: ',num2str(mppX)])
disp(['mppY: ',num2str(mppY)])
disp(['width: ',num2str(width)])
disp(['height: ',num2str(height)])
disp(['number of levels: ',num2str(numberOfLevels)])
% disp(['downsample factors: ',num2str(downsampleFactors)])
disp(['objective power: ',num2str(objectivePower)])

% Read a part of the image
ARGB = openslide_read_region(slidePtr,5000,15000,6000,6000,3);

% Display RGB part
figure(1)
imshow(ARGB(:,:,2:4))
set(gcf,'Name','WSI','NumberTitle','off')

% Get property names and display them
propertyNames = openslide_get_property_names(slidePtr);
disp(propertyNames(:))

% Get a property value
propertyValue = openslide_get_property_value(slidePtr,propertyNames{21});
disp(propertyValue)

% Get associated images
associatedImages = openslide_get_associated_image_names(slidePtr);
disp(associatedImages(:))

% Display all associated images
for k = 1 : length(associatedImages)
    disp(['Displaying: ',associatedImages{k}])
    label = openslide_read_associated_image(slidePtr,associatedImages{k});

    % Display label image
    figure(1+k)
    imshow(label(:,:,2:4))
    set(gcf,'Name',associatedImages{k},'NumberTitle','off')
    [w,h] = openslide_get_associated_image_dimensions(slidePtr,associatedImages{k});
    disp(['width: ',num2str(w)])
    disp(['height: ',num2str(h)])
end

% Close whole-slide image, note that the slidePtr must be removed manually
openslide_close(slidePtr)
clear slidePtr

% Unload library
openslide_unload_library