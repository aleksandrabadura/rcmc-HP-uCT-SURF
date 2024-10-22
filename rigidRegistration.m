fixed = io_roi_gray;
moving = croppedImage;
imshowpair(fixed,moving,"Scaling","independent");

[optimizer,metric] = imregconfig("multimodal");
optimizer.InitialRadius = 0.009;
optimizer.Epsilon = 1.5e-4;
optimizer.GrowthFactor = 1.01;
optimizer.MaximumIterations = 300;

movingRegistered = imregister(moving,fixed,"affine",optimizer,metric);

imshowpair(fixed,movingRegistered,"Scaling","independent");