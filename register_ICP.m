%% rejestracja ICP
% skalowanie obrazu HP do uCT
% opcjonalny obrót
% ICP

s=sqrt(sum(masks(:))/sum(bw2(:)));
bw3 = imresize(bw2,s);
bw3 = bwareafilt(bw3, 1); % Extract largest blob.

if flip
    bw3 = flipud(bw3);
    %bw3 = fliplr(bw3);
end

bw3 = imrotate(bw3,rot);


%% registration ICP

uCT_bound = bwboundaries(masks);
hist_bound = bwboundaries(bw3);


uCT_bound = single(uCT_bound{1,1});
uCT_bound(:,3) = 1;

hist_bound = single(hist_bound{1,1});
hist_bound(:,3) = 1;

uCTCloud = pointCloud(uCT_bound);
histCloud = pointCloud(hist_bound);

[tform,movingReg, rmse] = pcregistericp(uCTCloud,histCloud, 'Metric','planeToPlane' ,'MaxIterations', 1000, 'Verbose',true, 'Tolerance',[0.01, 0.00001]);

figure(2);
pcshowpair(uCTCloud,histCloud,VerticalAxis="Y",VerticalAxisDir="Down")


figure(3);
pcshowpair(movingReg,histCloud,VerticalAxis="Y",VerticalAxisDir="Down")

% %% imregister
% [optimizer,metric] = imregconfig("monomodal")
% moving_reg = imregister(single(masks),single(bw3), "rigid", optimizer,metric);
% figure(6);
% imshowpair(bw3,moving_reg,"Scaling","joint");