%%
% 参数改变为Synaptic_p.g_Sefe2Sefe_rec_NMDA = 0.215;%0.218
%%
clear;clc;
tic
mypool = parpool(12);
T_N = 20*1000;%4;
t_distri = zeros(3000,1);
parfor i=1:3000
    disp(i);
    [tFiring_rate_record, t] = NetworkDynamics(T_N);
    sce_fr = tFiring_rate_record(:,10);
    eye_move_time = find(sce_fr>5); %眼动时间段
    if ~isempty(eye_move_time)
        t_distri(i,1) = eye_move_time(1)+24; %眼动时刻，并且resacle到1000ms尺度,即25-975ms。
    else
        t_distri(i,1) = 0;
    end
    %----------------------------------------------------------------------
    fname = ['Fig/Data',num2str(i),'.csv'];
    csvwrite(fname,tFiring_rate_record);
    figure(1);
    plot(tFiring_rate_record(:,1), tFiring_rate_record(:,2:8));
    legend({'Sefe', 'Sefi', 'Sefii', 'LipE', 'LipI', 'Cd1', 'Cd2'});
    title('SEF region');
    set(gcf,'Visible','off')
    saveas(gcf,['Fig/SEF_sc',num2str(i),'.jpg']);
    close(gcf)
end
toc
t_distri = t_distri(t_distri>100); %去除SEFE没有放电情形
ahead_move_num = sum(t_distri<600);
trail_num = length(t_distri);
save('Data.mat','t_distri','ahead_move_num','trail_num');
delete(mypool);
%% Plot Figures
figure(1)
histogram(t_distri,20,'Normalization','pdf');
set(gca,'FontSize',16);
xlim([400 1000]);
ylim([0 0.01]);
set(gca,'XTick',400:200:1000);
set(gca,'YTick',0:0.005:0.01);
legend('SefE2E=0.215');
legend('boxoff');
xlabel('Eye Move Moment (ms)','fontsize',16,'FontWeight','bold');
ylabel('Probability Dense','fontsize',16,'FontWeight','bold');
set(gcf,'Visible','off')
saveas(gcf,'EyeMoveDistribution_SefE2E=0.215.jpg')
close(gcf)
