%%
clc;
clear all;
%% load data
load('A_data.mat');
load('B_data.mat');
%% 
figure(401);
% title('Raw data')
% xlabel(‘string’)
% ylabel(‘string’)
% text(x,y,'Raw data')
hold on
subplot(2,4,1);
plot(A_move_Information(:,3));
title('Right hand')
subplot(2,4,2);
plot(A_move_Information(:,5));
title('Left hand')
subplot(2,4,3);
plot(A_move_Information(:,7));
title('Head')
subplot(2,4,4);
plot(A_move_Information(:,9));
title('Body')
subplot(2,4,5);
plot(B_move_Information(:,3));
title('Right hand')
subplot(2,4,6);
plot(B_move_Information(:,5));
title('Left hand')
subplot(2,4,7);
plot(B_move_Information(:,7));
title('Head')
subplot(2,4,8);
plot(B_move_Information(:,9));
title('Body')
hold off
%% Mean filter
meanFilterindowSize = 80; % 2s : sample rate = 40Hz
A_meanFilter  = zeros(size(A_move_Information,1),9);
B_meanFilter  = zeros(size(A_move_Information,1),9);
for i = 1 + meanFilterindowSize : size(A_move_Information,1)
    A_meanFilter(i,:) = sum(A_move_Information(i-meanFilterindowSize+1:i,:))/meanFilterindowSize;
    B_meanFilter(i,:) = sum(B_move_Information(i-meanFilterindowSize+1:i,:))/meanFilterindowSize;
end
A_meanFilter(1:meanFilterindowSize,:) = A_move_Information(1:meanFilterindowSize,:);
B_meanFilter(1:meanFilterindowSize,:) = B_move_Information(1:meanFilterindowSize,:);

%% 
figure(402);
hold on
subplot(2,4,1);
plot(A_meanFilter(:,3));
title('Right hand')
subplot(2,4,2);
plot(A_meanFilter(:,5));
title('Left hand')
subplot(2,4,3);
plot(A_meanFilter(:,7));
title('Head')
subplot(2,4,4);
plot(A_meanFilter(:,9));
title('Body')
subplot(2,4,5);
plot(B_meanFilter(:,3));
title('Right hand')
subplot(2,4,6);
plot(B_meanFilter(:,5));
title('Left hand')
subplot(2,4,7);
plot(B_meanFilter(:,7));
title('Head')
subplot(2,4,8);
plot(B_meanFilter(:,9));
title('Body')
hold off

%%
figure(403);
hold on
differenceOfRightAndHead_A = A_meanFilter(:,5)-A_meanFilter(:,7);
plot(differenceOfRightAndHead_A);
differenceOfRightAndHead_B = B_meanFilter(:,5)-B_meanFilter(:,7);
plot(differenceOfRightAndHead_B);
hold off
%%
windowsSize = 200; % 5s : sample rate = 40Hz
dataSize = size(A_meanFilter,1);
R_corralation = zeros(fix(dataSize*2/windowsSize),16);
% A1 = A_data_055_move_changeSamplingRate(1:200,4);
% B1 = B_data_080_move_changeSamplingRate(1:200,4);
% R = corr2(A1,B1);
j = 1;
for i = 1+windowsSize:windowsSize/2:dataSize 
    A1 = A_meanFilter(i-windowsSize:i,3);
    A2 = A_meanFilter(i-windowsSize:i,5);
    A3 = A_meanFilter(i-windowsSize:i,7);
    A4 = A_meanFilter(i-windowsSize:i,9);
    B1 = B_meanFilter(i-windowsSize:i,3);
    B2 = B_meanFilter(i-windowsSize:i,5);
    B3 = B_meanFilter(i-windowsSize:i,7);
    B4 = B_meanFilter(i-windowsSize:i,9);
    R_corralation(j,1) = abs(corr2(A1,B1));
    R_corralation(j,2) = abs(corr2(A1,B2));
    R_corralation(j,3) = abs(corr2(A1,B3));
    R_corralation(j,4) = abs(corr2(A1,B4));
    R_corralation(j,5) = abs(corr2(A2,B1));
    R_corralation(j,6) = abs(corr2(A2,B2));
    R_corralation(j,7) = abs(corr2(A2,B3));
    R_corralation(j,8) = abs(corr2(A2,B4));
    R_corralation(j,9) = abs(corr2(A3,B1));
    R_corralation(j,10) = abs(corr2(A3,B2));
    R_corralation(j,11) = abs(corr2(A3,B3));
    R_corralation(j,12) = abs(corr2(A3,B4));
    R_corralation(j,13) = abs(corr2(A4,B1));
    R_corralation(j,14) = abs(corr2(A4,B2));
    R_corralation(j,15) = abs(corr2(A4,B3));
    R_corralation(j,16) = abs(corr2(A4,B4));
    j = j+1;
end
%%
figure(404);
hold on
for i = 1:16
    subplot(4,4,i);
    plot(R_corralation(:,i));
end
hold off



