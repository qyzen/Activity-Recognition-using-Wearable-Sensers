%%
clc;
clear all;
%% load data
load('A_data.mat');
load('B_data.mat');
%%
changeSumWindowSize = 80; % 5s : sample rate = 40Hz
A_changeSum  = zeros(size(A_moveInfoChange,1),13);
B_changeSum  = zeros(size(A_moveInfoChange,1),13);
for i = 1 : size(A_moveInfoChange,1)-changeSumWindowSize
    A_changeSum(i,:) = sum(A_moveInfoChange(i:i+changeSumWindowSize-1,:));
    B_changeSum(i,:) = sum(B_moveInfoChange(i:i+changeSumWindowSize-1,:));
end

%% 
figure(402);
subplot(2,1,1)
hold on
    plot(A_changeSum(:,3),'r');
    plot(B_changeSum(:,3),'b');
hold off
title('right hand acceleration of two')
    subplot(2,1,2)
    hold on
    plot(A_changeSum(:,4),'r');
    plot(B_changeSum(:,4),'b');
hold off
title('right hand angular velocity of two')
%%
windowsSize = 200; % 5s : sample rate = 40Hz
dataSize = size(A_moveInfoChange,1);
R_corralation = zeros(fix(dataSize*2/windowsSize),18);
% A1 = A_data_055_move_changeSamplingRate(1:200,4);
% B1 = B_data_080_move_changeSamplingRate(1:200,4);
% R = corr2(A1,B1);
j = 1;
for i = 1+windowsSize:windowsSize/2:dataSize 
    A1 = A_changeSum(i-windowsSize:i,4);
    A2 = A_changeSum(i-windowsSize:i,7);
    A3 = A_changeSum(i-windowsSize:i,10);
    A4 = A_changeSum(i-windowsSize:i,13);
    B1 = B_changeSum(i-windowsSize:i,4);
    B2 = B_changeSum(i-windowsSize:i,7);
    B3 = B_changeSum(i-windowsSize:i,10);
    B4 = B_changeSum(i-windowsSize:i,13);
    Freq=40;
    
    [cor,lag] = xcorr(A1,B1);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,1);
    plot(lag,cor);
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A1,B2);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,2);
    plot(lag,cor);   
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A1,B3);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,3);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A1,B4);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,4);
    plot(lag,cor);
    ylim([-10000 5000]);
     
    [cor,lag] = xcorr(A2,B1);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,5);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A2,B2);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,6);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A2,B3);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,7);
    plot(lag,cor);
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A2,B4);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,8);
    plot(lag,cor);
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A3,B1);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,9);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A3,B2);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,10);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A3,B3);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,11);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A3,B4);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,12);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A4,B1);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,13);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A4,B2);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,14);
    plot(lag,cor);
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A4,B3);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,15);
    plot(lag,cor); 
    ylim([-10000 5000]);
    
    [cor,lag] = xcorr(A4,B4);
    [maxcorr,I] = max(abs(cor));
    lagDiff = lag(I);
    timeDiff = lagDiff/Freq;
    subplot(4,4,16);
    plot(lag,cor); 
    ylim([-10000 5000]);

end
%%
figure(403);
hold on
for i = 1:16
    subplot(4,4,i);
    plot(R_corralation(:,i));
end
hold off





