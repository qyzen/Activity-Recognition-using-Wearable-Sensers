%%
clc;
clear all;
%% load data
load('A_data_055_timeChange.mat');
load('B_data_080_timeChange.mat');
%%
Channel_Data = A_data_055;
Channel_move_Information = zeros(size(Channel_Data,1),6);
for i = 1:size(Channel_Data,1)
    Channel_move_Information(i,1) = Channel_Data(i,1);
    Channel_move_Information(i,2) = Channel_Data(i,2);
    Channel_move_Information(i,3) = Channel_Data(i,3);
    Channel_move_Information(i,4) = sqrt(Channel_Data(i,4)^2+Channel_Data(i,5)^2+Channel_Data(i,6)^2);
    Channel_move_Information(i,5) = sqrt(Channel_Data(i,7)^2+Channel_Data(i,8)^2+Channel_Data(i,9)^2);
    Channel_move_Information(i,6) = sqrt(Channel_Data(i,10)^2+Channel_Data(i,11)^2+Channel_Data(i,12)^2);
end
A_data_055_move = Channel_move_Information;
Channel_Data = B_data_080;
Channel_move_Information = zeros(size(Channel_Data,1),6);
for i = 1:size(Channel_Data,1)
    Channel_move_Information(i,1) = Channel_Data(i,1);
    Channel_move_Information(i,2) = Channel_Data(i,2);
    Channel_move_Information(i,3) = Channel_Data(i,3);
    Channel_move_Information(i,4) = sqrt(Channel_Data(i,4)^2+Channel_Data(i,5)^2+Channel_Data(i,6)^2);
    Channel_move_Information(i,5) = sqrt(Channel_Data(i,7)^2+Channel_Data(i,8)^2+Channel_Data(i,9)^2);
    Channel_move_Information(i,6) = sqrt(Channel_Data(i,10)^2+Channel_Data(i,11)^2+Channel_Data(i,12)^2);
end
B_data_080_move = Channel_move_Information;
%%
j = 1 ;
k = 1 ;
l = 1 ;
m = 1 ;
A_data_055_move_1 = zeros(12,6);    % Right hand
A_data_055_move_2 = zeros(12,6);    % Left hand
A_data_055_move_3 = zeros(12,6);    % Head
A_data_055_move_4 = zeros(12,6);    % Body
for i = 1 : size(A_data_055_move,1)
    switch A_data_055_move(i,2)
        case 1
            A_data_055_move_1(j,:) = A_data_055_move(i,:);
            j = j + 1 ;
        case 2
            A_data_055_move_2(k,:) = A_data_055_move(i,:);
            k = k + 1 ;
        case 3
            A_data_055_move_3(l,:) = A_data_055_move(i,:);
            l = l + 1 ;
        case 4
            A_data_055_move_4(m,:) = A_data_055_move(i,:);
            m = m + 1 ;
        otherwise
    end
end  
%% Display data to check
figure(301);
hold on
    plot(A_data_055_move_1(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(302);
hold on
    plot(A_data_055_move_2(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(303);
hold on
    plot(A_data_055_move_3(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(304);
hold on
    plot(A_data_055_move_4(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
%%
A_data_055_move_line = min(min(i,j),min(l,m))-1;
A_data_055_move = zeros(A_data_055_move_line,14);
for i = 1:A_data_055_move_line
    A_data_055_move(i,1) = A_data_055_move_1(i,1);
    A_data_055_move(i,2:5) = A_data_055_move_1(i,3:6);
    A_data_055_move(i,6:8) = A_data_055_move_2(i,4:6);
    A_data_055_move(i,9:11) = A_data_055_move_3(i,4:6);
    A_data_055_move(i,12:14) = A_data_055_move_4(i,4:6);
end
%%
j = 1 ;
k = 1 ;
l = 1 ;
m = 1 ;
B_data_080_move_1 = zeros(12,6);
B_data_080_move_2 = zeros(12,6);
B_data_080_move_3 = zeros(12,6);
B_data_080_move_4 = zeros(12,6);
for i = 1 : size(B_data_080_move,1)
    switch B_data_080_move(i,2)
        case 1
            B_data_080_move_1(j,:) = B_data_080_move(i,:);
            j = j + 1 ;
        case 2
            B_data_080_move_2(k,:) = B_data_080_move(i,:);
            k = k + 1 ;
        case 3
            B_data_080_move_3(l,:) = B_data_080_move(i,:);
            l = l + 1 ;
        case 4
            B_data_080_move_4(m,:) = B_data_080_move(i,:);
            m = m + 1 ;
        otherwise
    end
end 
%% Display data to check
figure(305);
hold on
    plot(B_data_080_move_1(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(306);
hold on
    plot(B_data_080_move_2(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(307);
hold on
    plot(B_data_080_move_3(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
figure(308);
hold on
    plot(B_data_080_move_4(:,4),'r');
%     plot(A_data_055_move(:,5),'b');
%     plot(A_data_055_move(:,6),'g');
hold off
%%
B_data_080_move_line = min(min(i,j),min(l,m))-1;
B_data_080_move = zeros(B_data_080_move_line,14);
for i = 1:B_data_080_move_line
    B_data_080_move(i,1) = B_data_080_move_1(i,1);
    B_data_080_move(i,2:5) = B_data_080_move_1(i,3:6);
    B_data_080_move(i,6:8) = B_data_080_move_2(i,4:6);
    B_data_080_move(i,9:11) = B_data_080_move_3(i,4:6);
    B_data_080_move(i,12:14) = B_data_080_move_4(i,4:6);
end
%%
% A_data_055_move
% B_data_080_move
% 
% for 
% 
% %%

A_data_055_move_changeSamplingRate = zeros(20,14);
i = 1;
j = 1;
while(A_data_055_move(size(A_data_055_move,1),2)>j*50)
    if(A_data_055_move(i,2)>j*50)
        A_data_055_move_changeSamplingRate(j,1) = A_data_055_move(i,1);
        A_data_055_move_changeSamplingRate(j,2) = j*50;
        A_data_055_move_changeSamplingRate(j,3:14) = A_data_055_move(i,3:14);
        j = j + 1 ;
    end
    if(A_data_055_move(i,2)<=j*50 && A_data_055_move(i+1,2)>j*50)
        A_data_055_move_changeSamplingRate(j,1) = A_data_055_move(i,1);
        A_data_055_move_changeSamplingRate(j,2) = j*50;
        A_data_055_move_changeSamplingRate(j,3:14) = A_data_055_move(i,3:14)/2 + A_data_055_move(i+1,3:14)/2;
        j = j + 1 ;
    else
        i = i + 1 ;
    end
end
%%
B_data_080_move_changeSamplingRate = zeros(20,14);
i = 1;
j = 1;
while(B_data_080_move(size(B_data_080_move,1),2)>j*50)
    if(B_data_080_move(i,2)>j*50)
        B_data_080_move_changeSamplingRate(j,1) = B_data_080_move(i,1);
        B_data_080_move_changeSamplingRate(j,2) = j*50;
        B_data_080_move_changeSamplingRate(j,3:14) = B_data_080_move(i,3:14);
        j = j + 1 ;
    end
    if(B_data_080_move(i,2)<=j*50 && B_data_080_move(i+1,2)>j*50)
        B_data_080_move_changeSamplingRate(j,1) = B_data_080_move(i,1);
        B_data_080_move_changeSamplingRate(j,2) = j*50;
        B_data_080_move_changeSamplingRate(j,3:14) = B_data_080_move(i,3:14)/2 + B_data_080_move(i+1,3:14)/2;
        j = j + 1 ;
    else
        i = i + 1 ;
    end
end

%% save move data
save('A_data_055_move_changeSampleRate', 'A_data_055_move_changeSamplingRate');
save('B_data_080_move_changeSampleRate', 'B_data_080_move_changeSamplingRate');
