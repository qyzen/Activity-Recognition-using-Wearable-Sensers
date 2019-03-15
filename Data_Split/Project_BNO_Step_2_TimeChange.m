%%
clc;
clear all;
%% load data
load('A_data_055_input.mat');
load('B_data_080_input.mat');
%%
A_data_055 = A_data_055_input(:,1:12);
B_data_080 = B_data_080_input(:,1:12);

figure(101);
hold on
 plot(A_data_055(:,1)-A_data_055(1,1),'r');
 plot(A_data_055(:,3)-A_data_055(1,3),'b');
 plot(B_data_080(:,13)-B_data_080(1,13),'r');
 plot(B_data_080(:,3)-B_data_080(1,3),'b'); 
hold off
%%
A_data_055(:,1) = mod(A_data_055(:,1),1000000000);
for i = 2 : size(A_data_055,1)
    if(A_data_055(i,1)<A_data_055(i-1,1))
        A_data_055(i,1) = A_data_055(i,1)+1000;
    end
end
B_data_080(:,1) = mod(B_data_080(:,1),1000000000);
for i = 2 : size(B_data_080,1)
    if(B_data_080(i,1)<B_data_080(i-1,1))
        B_data_080(i,1) = B_data_080(i,1)+1000;
    end
end

%%
A_data_055_beginTime = A_data_055(1,1);
A_data_055_hourTime = floor(A_data_055_beginTime/10000000);
A_data_055_minuteTime = rem(floor(A_data_055_beginTime/100000),100);
A_data_055_secondTime = rem(floor(A_data_055_beginTime/1000),100);
A_data_055_millisecondTime = rem(A_data_055_beginTime,1000);
for i = 2:size(A_data_055,1)
    if(A_data_055(i,1)>=A_data_055_beginTime)
        hourTime = floor(A_data_055(i,1)/10000000) - A_data_055_hourTime;
        minuteTime = hourTime*60 + rem(floor(A_data_055(i,1)/100000),100) - A_data_055_minuteTime;
        secondTime = minuteTime*60 + rem(floor(A_data_055(i,1)/1000),100) - A_data_055_secondTime;
        millisecondTime = secondTime*1000 + rem(A_data_055(i,1),1000) - A_data_055_millisecondTime;
        A_data_055(i,13) = millisecondTime;
    else
        A_data_055(i,13) = -1;
    end
end

B_data_080_beginTime = B_data_080(1,1);
B_data_080_hourTime = floor(B_data_080_beginTime/10000000);
B_data_080_minuteTime = rem(floor(B_data_080_beginTime/100000),100);
B_data_080_secondTime = rem(floor(B_data_080_beginTime/1000),100);
B_data_080_millisecondTime = rem(B_data_080_beginTime,1000);
for i = 2:size(B_data_080,1)
    if(B_data_080(i,1)>=B_data_080_beginTime)
        hourTime = floor(B_data_080(i,1)/10000000) - B_data_080_hourTime;
        minuteTime = hourTime*60 + rem(floor(B_data_080(i,1)/100000),100) - B_data_080_minuteTime;
        secondTime = minuteTime*60 + rem(floor(B_data_080(i,1)/1000),100) - B_data_080_secondTime;
        millisecondTime = secondTime*1000 + rem(B_data_080(i,1),1000) - B_data_080_millisecondTime;
        B_data_080(i,13) = millisecondTime;
    else
        B_data_080(i,13) = -1;
    end
end
%%
figure(101);
hold on
 plot(A_data_055(:,13)-A_data_055(1,13) + 1,'r');
 plot(A_data_055(:,3)-A_data_055(1,3),'b');
 plot(B_data_080(:,13)-B_data_080(1,13),'r');
 plot(B_data_080(:,3)-B_data_080(1,3),'b'); 
hold off
%%
A_data_055_SamplingRate = zeros(size(A_data_055,1),2);
for i = 2 : size(A_data_055,1)
    A_data_055_SamplingRate(i-1,1) = A_data_055(i,13) - A_data_055(i-1,13);
    A_data_055_SamplingRate(i-1,2) = A_data_055(i,3) - A_data_055(i-1,3);
end
A_data_055_SamplingRate_mean = mean(mean(A_data_055_SamplingRate,1));

B_data_080_SamplingRate = zeros(size(B_data_080,1),2);
for i = 3 : size(B_data_080,1)
    B_data_080_SamplingRate(i-1,1) = B_data_080(i,13) - B_data_080(i-1,13);
    B_data_080_SamplingRate(i-1,2) = B_data_080(i,3) - B_data_080(i-1,3);
end
B_data_080_SamplingRate_mean = mean(mean(B_data_080_SamplingRate,1));

%%
figure(102);
hold on
 plot(A_data_055_SamplingRate(:,1),'r');
 plot(A_data_055_SamplingRate(:,2),'b');
 plot(B_data_080_SamplingRate(:,1),'r');
 plot(B_data_080_SamplingRate(:,2),'b');
hold off

%%

C_data_beginTime = max(A_data_055(1,1),B_data_080(1,1));
C_data_endTime = min(A_data_055(size(A_data_055,1),1),B_data_080(size(B_data_080,1),1));

for i = 1 : size(A_data_055,1)
    if (A_data_055(i,1) <= C_data_beginTime)
        A_data_055_bothbegin_i = i;
    end
    if(A_data_055(i,1) <= C_data_endTime)
        A_data_055_bothend_j = i;
    end
end

for i = 1 : size(B_data_080,1)
    if (B_data_080(i,1) <= C_data_beginTime)
        B_data_080_bothbegin_i = i;
    end
    if(B_data_080(i,1) <= C_data_endTime)
        B_data_080_bothend_j = i;
    end    
end

A_data_055_bothbegin = A_data_055(A_data_055_bothbegin_i:A_data_055_bothend_j,:);
B_data_080_bothbegin = B_data_080(B_data_080_bothbegin_i:B_data_080_bothend_j,:);
%%

for i = 2:size(A_data_055_bothbegin,1)
    A_data_055_bothbegin(i,3) = A_data_055_bothbegin(i,3) - A_data_055_bothbegin(1,3) ;
    A_data_055_bothbegin(i,13) = A_data_055_bothbegin(i,13) - A_data_055_bothbegin(1,13) ;
end
    A_data_055_bothbegin(1,3) = A_data_055_bothbegin(1,3) - A_data_055_bothbegin(1,3) ;
    A_data_055_bothbegin(1,13) = A_data_055_bothbegin(1,13) - A_data_055_bothbegin(1,13) ;

for i = 2 : size(B_data_080_bothbegin,1) 
    B_data_080_bothbegin(i,3) = B_data_080_bothbegin(i,3) - B_data_080_bothbegin(1,3) ;
    B_data_080_bothbegin(i,13) = B_data_080_bothbegin(i,13) - B_data_080_bothbegin(1,13) ;
end
    B_data_080_bothbegin(1,3) = B_data_080_bothbegin(1,3) - B_data_080_bothbegin(1,3) ;
    B_data_080_bothbegin(1,13) = B_data_080_bothbegin(1,13) - B_data_080_bothbegin(1,13) ;
%%
figure(3);
hold on
 plot(A_data_055_bothbegin(:,3),'r');
 plot(A_data_055_bothbegin(:,13),'b');
 plot(B_data_080_bothbegin(:,3),'r');
 plot(B_data_080_bothbegin(:,13),'b');
hold off
%%
A_data_055 = A_data_055_bothbegin(:,1:12);
B_data_080 = B_data_080_bothbegin(:,1:12);
% A_data_055_SampleRate = A_data_055_SamplingRate_mean;
% B_data_080_SampleRate = B_data_080_SamplingRate_mean;
%%
save('A_data_055_timeChange', 'A_data_055');
save('B_data_080_timeChange', 'B_data_080');




