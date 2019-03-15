%%
clc;
clear all;
%% load experiment data
A_Right = Untitled;
%%
A_Left = Untitled;
%%
A_Head = Untitled;
%%
A_Body = Untitled;
%%
save('A_input', 'A_Right', 'A_Left', 'A_Head', 'A_Body');
%%
clc;
clear all;
%%
B_Right = Untitled;
%%
B_Left = Untitled;
%%
B_Head = Untitled;
%%
B_Body = Untitled;
%%
save('B_input','B_Right', 'B_Left', 'B_Head', 'B_Body');
%% 有线的数据
% %%
% B_input = TestConversationFourBNO055120190217143246;
% %%
% j = 1 ;
% k = 1 ;
% l = 1 ;
% m = 1 ;
% B_Right = zeros(32,32);
% B_Left = zeros(32,32);
% B_Head = zeros(32,32);
% B_Body = zeros(32,32);
% for i = 1:size(B_input,1)
%     switch B_input(i,2)
%         case 1
%             B_Right(j,:) = B_input(i,:);
%             j = j + 1 ;
%         case 2
%             B_Left(k,:) = B_input(i,:);
%             k = k + 1 ;
%         case 3
%             B_Head(l,:) = B_input(i,:);
%             l = l + 1 ;
%         case 4
%             B_Body(m,:) = B_input(i,:);
%             m = m + 1 ;
%         otherwise
%     end
% end
% %%
% save('B_input','B_Right', 'B_Left', 'B_Head', 'B_Body');