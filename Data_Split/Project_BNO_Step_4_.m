%%
clc;
clear all;
%% load data
load('A_data_055_move_changeSampleRate.mat');
load('B_data_080_move_changeSampleRate.mat');
%% 
% figure(401);
% hold on
%     plot(A_data_055_move_changeSamplingRate(:,3),'r');
% %     plot(A_data_055_move(:,5),'b');
% %     plot(A_data_055_move(:,6),'g');
%     plot(B_data_080_move_changeSamplingRate(:,9),'b');
% %     plot(A_data_055_move(:,5),'b');
% %     plot(A_data_055_move(:,6),'g');
% hold off
%%
i = 1 ;
while(A_data_055_move_changeSamplingRate(i,1)<151911000 )
    i = i + 1 ;
end
A_data_paragraph_1(:,:) = A_data_055_move_changeSamplingRate(i:i+800,:);
i = 1 ;
while(B_data_080_move_changeSamplingRate(i,1)<151911000 )
    i = i + 1 ;
end
B_data_paragraph_1(:,:) = B_data_080_move_changeSamplingRate(i:i+800,:);

%%
figure(402);
hold on
    plot(A_data_paragraph_1(:,3),'r');
    plot(B_data_paragraph_1(:,3),'b');
hold off
%%
A = A_data_paragraph_1(:,3);
B = B_data_paragraph_1(:,3);

R1 = corr2(A,B);
%%
% C = zeros(201,1);
% for i = 1 : size(A,1)
%     if(A(i,1)>9.8)
%         C(i,1) = 1;
%     else
%         C(i,1) = 0 ;
%     end
% end
% for i = 1 : size(B,1)
%     if(B(i,1)>9.8)
%         D(i,1) = 1;
%     else
%         D(i,1) = 0 ;
%     end
% end
% R2 = corr2(C,D);
 %%
% figure(403);
% hold on
%     plot(C,'r');
%     plot(D,'b');
% hold off








