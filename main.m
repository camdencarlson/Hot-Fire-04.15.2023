load("offset.mat")
load("luke.mat")
% figurCamsGripStrengthe()
% plot(offset(:,1),offset(:,2))


offset_mean = mean(offset(:,2));


luke_offset = mean(luke(:,2)) - offset_mean;

gain = 170/luke_offset;


luke_true = luke_offset .* gain;


%%
load("CamsGripStrength.mat")
grip_offset = mean(CamsGripStrength) - offset_mean;
grip_true = grip_offset .* gain;

%%
load("copper.mat")
copper_offset = mean(copper) - offset_mean;
gain = 26.1 / copper_offset;

copper_true = copper_offset.*gain;
grip_true = grip_offset*gain;

luke_true = luke_offset*gain

%%
load("fire.mat")
fire_data_offset = fire - offset_mean;
fire_true = -fire_data_offset*1000;
time = (1:length(fire_true))./50';

plot(time(time>3820 & time<3910),fire_true(time>3820 & time<3910))