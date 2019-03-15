%%
clc;
clear all;
%% load data
load('A_input.mat');
load('B_input.mat');
%% Sample rate synchronization
% Sample rate = 40Hz 
% Cycle Time = 0.025s

maxRow1 = max(max(size(A_Right,1),size(A_Left,1)),max(size(A_Head,1),size(A_Body,1)));
maxRow2 = max(max(size(B_Right,1),size(B_Left,1)),max(size(B_Head,1),size(B_Body,1)));
maxRow = max(maxRow1,maxRow2);
A_move_Information = zeros(maxRow,13);
B_move_Information = zeros(maxRow,13);
for k = 1:8
    switch k
        case 1
            C_data = A_Right;
        case 2
            C_data = A_Left;
        case 3
            C_data = A_Head;
        case 4
            C_data = A_Body;
        case 5
            C_data = B_Right;
        case 6
            C_data = B_Left;            
        case 7
            C_data = B_Head;
        case 8
            C_data = B_Body;            
        otherwise
    end          
    C_changeSampleRate = zeros(maxRow,9);
    i = 1;
    j = 0.025;
    m = 1 ;
    while m <  maxRow
        if(C_data(i,1)<=j)
            if(C_data(i+1,1)>j)
                C_changeSampleRate(m,1) = j;
                C_changeSampleRate(m,2) = C_data(i,2);
                C_changeSampleRate(m,3:9) = (C_data(i,3:9)+ C_data(i+1,3:9))/2;
                j = j + 0.025 ;
                m = m + 1 ;
            else
                if i < size(C_data,1)-1
                    i = i + 1 ;
                end
            end
        else
            C_changeSampleRate(m,1) = j;
            C_changeSampleRate(m,2) = C_data(i,2);
            C_changeSampleRate(m,3:9) = C_data(i,3:9);
            j = j + 0.025 ;
            m = m + 1 ;
        end
    end
    Channel_move_Information = zeros(maxRow,4);
    for i = 1:maxRow
        Channel_move_Information(i,1) = C_changeSampleRate(i,1);
        Channel_move_Information(i,2) = C_changeSampleRate(i,3);
        Channel_move_Information(i,3) = sqrt(C_changeSampleRate(i,4)^2+C_changeSampleRate(i,5)^2+C_changeSampleRate(i,6)^2);
        Channel_move_Information(i,4) = sqrt(C_changeSampleRate(i,7)^2+C_changeSampleRate(i,8)^2+C_changeSampleRate(i,9)^2);
    end  
    switch k
        case 1
            A_move_Information(:,1:4) = Channel_move_Information(:,1:4);
        case 2
            A_move_Information(:,5:7) = Channel_move_Information(:,2:4);
        case 3
            A_move_Information(:,8:10) = Channel_move_Information(:,2:4);
        case 4
            A_move_Information(:,11:13) = Channel_move_Information(:,2:4);
        case 5
            B_move_Information(:,1:4) = Channel_move_Information(:,1:4);
        case 6
            B_move_Information(:,5:7) = Channel_move_Information(:,2:4);            
        case 7
            B_move_Information(:,8:10) = Channel_move_Information(:,2:4);
        case 8
            B_move_Information(:,11:13) = Channel_move_Information(:,2:4);           
        otherwise
    end
end
%%
A_moveInfoChange = zeros(maxRow,13);
B_moveInfoChange = zeros(maxRow,13);
for i = 1:maxRow-2
    A_moveInfoChange(i,:) = A_move_Information(i+1,:) - A_move_Information(i,:);
    B_moveInfoChange(i,:) = B_move_Information(i+1,:) - B_move_Information(i,:);
end
%%
save('A_data', 'A_moveInfoChange','A_move_Information');
save('B_data', 'B_moveInfoChange','B_move_Information');
