%% Here we try and get the Covariance as a function of the distance between maximas(basically we try and see whether the maximas in Pearson corelation correspond to the lag equal to the maximal distance
load('spn');
cell_index=56; %%which cell we are looking at
pcc_tick=6;


%%the average distance between maxima for each cell
myo_pcc=cell_myosin(cell_index).mean(1:25,:);
rok_pcc=cell_rok(cell_index).mean(1:25,:);

subplot(2,1,1)

myo=plot(myo_pcc,'Color',[0 0 1]);
grid on;
hold on;
rok=plot(rok_pcc,'Color',[0 1 0]);
legend('myosin','rok');
ylabel('Intensity');
xlabel('Distance from Rok Focus of the Cell');


subplot(2,1,2)
% Plot lag vs intensity
pcc_lag=xcov(myo_pcc,rok_pcc,pcc_tick,'coeff')
plot(pcc_lag)
set(gca,'XTick', [0:1:2*pcc_tick+1] )
set(gca,'XTickLabel',[-pcc_tick:1:pcc_tick] ); 
%# vertical line of error bars between the two(because I am not using point of maximum intensity as center but I am using the point of 15% threshold as center
hx_1 = graph2d.constantline(cell(cell_index).average_maxima_distance+pcc_tick, 'Color',[1 0 0]);
changedependvar(hx_1,'x');
hx_2 = graph2d.constantline(pcc_tick, 'Color',[0 0 0]);
changedependvar(hx_2,'x');
legend('Pearson Correlation Coefficient for different lags','Average Distance between Rok and Myosin intensity maxima');
ylabel('Pearson Correlation Coefficient');
xlabel('Lag applied');

grid on;

%#

cell(cell_index).average_maxima_distance