clc
close all
clear all

rng(1)

global raise_tiff dir90_14 dir90_06 dir90_08 dir90_1 dir90_12 dir_one raw qf1 rot_angle

raise_tiff = '/media/data/mohit/raise_dataset/';
dir_one = '/media/data/mohit/Raise_dataset_init_crop_1024/one_time/'; % try not saving
dir90_06 = '/media/data/mohit/Raise_dataset_init_crop_1024_rot_more/90_06';
dir90_08 = '/media/data/mohit/Raise_dataset_init_crop_1024_rot_more/90_08';
dir90_1 = '/media/data/mohit/Raise_dataset_init_crop_1024_rot_more/90_1';
dir90_12 = '/media/data/mohit/Raise_dataset_init_crop_1024_rot_more/90_12';
dir90_14 = '/media/data/mohit/Raise_dataset_init_crop_1024_rot_more/90_14';

mkdir(dir_one)



raw = dir(strcat(raise_tiff,'*.TIF'));

qf1 = randi([5,9],numel(raw),1)*10;
rot_angle = randi([1,5],numel(raw),1)*4;



% training 1-4999 for each class
% validation 5000-6000 for each class
% testing 6500-7500 for each class

phase(1,4999,'train')

phase(5000,6000,'val')

phase(6500,7500,'test')




%% local functions

function [II] = center_crop(II)


[p3, p4, ~] = size(II);
q1 = 1024; %% size of the crop box
i3_start = floor((p3-q1)/2); % or round instead of floor; using neither gives warning
i3_stop = i3_start + q1;

i4_start = floor((p4-q1)/2);
i4_stop = i4_start + q1;

II = II(i3_start:i3_stop, i4_start:i4_stop, :);


end

function [] = phase(beg,endd,ph)

global raise_tiff dir90_14 dir90_06 dir90_08 dir90_1 dir90_12 dir_one raw qf1 rot_angle

mkdir(strcat(dir90_06,'/plus/',ph))
mkdir(strcat(dir90_06,'/negative/',ph))

mkdir(strcat(dir90_08,'/plus/',ph))
mkdir(strcat(dir90_08,'/negative/',ph))

mkdir(strcat(dir90_1,'/plus/',ph))
mkdir(strcat(dir90_1,'/negative/',ph))

mkdir(strcat(dir90_12,'/plus/',ph))
mkdir(strcat(dir90_12,'/negative/',ph))

mkdir(strcat(dir90_14,'/plus/',ph))
mkdir(strcat(dir90_14,'/negative/',ph))

for i = beg:endd
    img = imread(strcat(raise_tiff,raw(i).name));
    img = center_crop(img);
    
    imwrite(img,strcat(dir_one,'tmp.jpg'),'Quality',qf1(i))
    img = imread(strcat(dir_one,'tmp.jpg'));
    
    tmpp = imresize(img,0.6);
    
    tmpp_plus = imrotate(tmpp,rot_angle(i));
    imwrite(tmpp_plus,strcat(dir90_06,'/plus/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp_negative = imrotate(tmpp,-rot_angle(i));
    imwrite(tmpp_negative,strcat(dir90_06,'/negative/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp = imresize(img,0.8);
    
    tmpp_plus = imrotate(tmpp,rot_angle(i));
    imwrite(tmpp_plus,strcat(dir90_08,'/plus/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp_negative = imrotate(tmpp,-rot_angle(i));
    imwrite(tmpp_negative,strcat(dir90_08,'/negative/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp = imresize(img,1);
    
    tmpp_plus = imrotate(tmpp,rot_angle(i));
    imwrite(tmpp_plus,strcat(dir90_1,'/plus/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp_negative = imrotate(tmpp,-rot_angle(i));
    imwrite(tmpp_negative,strcat(dir90_1,'/negative/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp = imresize(img,1.2);
    
    tmpp_plus = imrotate(tmpp,rot_angle(i));
    imwrite(tmpp_plus,strcat(dir90_12,'/plus/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp_negative = imrotate(tmpp,-rot_angle(i));
    imwrite(tmpp_negative,strcat(dir90_12,'/negative/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp = imresize(img,1.4);
    
    tmpp_plus = imrotate(tmpp,rot_angle(i));
    imwrite(tmpp_plus,strcat(dir90_14,'/plus/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
    
    tmpp_negative = imrotate(tmpp,-rot_angle(i));
    imwrite(tmpp_negative,strcat(dir90_14,'/negative/',ph,'/',strrep(raw(i).name,'.TIF','.jpg')),'Quality',90);
end

end
