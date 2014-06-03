%%
load('spn.mat');


AVERAGE_spn=[];

A_hold=imread('RokProj_z008_c001.tif');
imshow(A_hold)
hold on;
for cell_index=1:cell_number, %this mega for loop calculates the COM for all the cells which are taken from the edge output
 

    plot(cell_rok(cell_index).COM_X, cell_rok(cell_index).COM_Y, 'rx');
   
    hold on;

    %%DO NOT FORGET TO HOLD ON
   
    %%RADIAL INTENSITY DISTRIBUTION FOR ROK
    
    
    %%THIS PLOTS THE CELL NUMBER ONTO THE CELL
  text( cell(cell_index).COM_X, cell(cell_index).COM_Y, [num2str(cell_index)],'Color', 'g');   
    
  
  %%Average using the method Adam suggested
    cell(cell_index).maxima_distance = sqrt(sum(abs(cell_rok(cell_index).MAX - cell_myosin(cell_index).MAX).^2,2));
    
   cell(cell_index).average_maxima_distance_adam = mean(cell(cell_index).maxima_distance);
   
   
   %%THIS PLOTS THE Distance between maximas(adam) ONTO THE CELL
  text( cell(cell_index).COM_X, cell(cell_index).COM_Y+5, [num2str(cell(cell_index).average_maxima_distance_adam)],'Color', 'y');  


  %%
 
  %%Average using average of averages
  if(size(cell_rok(cell_index).mean,1)>=30) 
   [r_rok,t_rok]=max(cell_rok(cell_index).mean(1:30,:))
   [r_myosin,t_myosin]=max(cell_myosin(cell_index).mean(1:30,:))
  end 
   
  if(size(cell_rok(cell_index).mean,1)<30) 
    [r_rok,t_rok]=max(cell_rok(cell_index).mean);
   [r_myosin,t_myosin]=max(cell_myosin(cell_index).mean);
  end
   cell(cell_index).average_maxima_distance = abs(t_myosin-t_rok);
  abs(t_myosin-t_rok)
   
   AVERAGE_spn=[AVERAGE_spn;cell(cell_index).average_maxima_distance]; 
   
   
   %%THIS PLOTS THE Distance between maximas(average of average) ONTO THE CELL
  text( cell(cell_index).COM_X, cell(cell_index).COM_Y+10, [num2str(cell(cell_index).average_maxima_distance)],'Color', 'b');  



end

k = waitforbuttonpress ;
    hold off;

    subplot(2,2,1)
 boxplot(.1417*AVERAGE_spn)
     title('SPN Mutant')
     %ylabel('Microns');
     ylim([0 16]);
    subplot(2,2,3)
    
    %%plotting the histogram
hist(.1417*AVERAGE_spn)
     title('SPN Mutant')
      h = findobj(gca,'Type','patch');
set(h,'FaceColor',[0 .5 .5],'EdgeColor','w');
    ylim([0 90])
     hold on 

     hold on   


%%
%%HERE WE JUST DO THE SAME FOR WILD TYPE
load('wildtype.mat');


AVERAGE_wildtype=[];

for cell_index=1:cell_number, %this mega for loop calculates the COM for all the cells which are taken from the edge output
 

  
  %%Average using the method Adam suggested
    cell(cell_index).maxima_distance = sqrt(sum(abs(cell_rok(cell_index).MAX - cell_myosin(cell_index).MAX).^2,2));
    
   cell(cell_index).average_maxima_distance_adam = mean(cell(cell_index).maxima_distance);
   


  %%
  %%Average using average of averages
  if(size(cell_rok(cell_index).mean,1)>=30) 
   [r_rok,t_rok]=max(cell_rok(cell_index).mean(1:30,:));
   [r_myosin,t_myosin]=max(cell_myosin(cell_index).mean(1:30,:));
  end 
   
  if(size(cell_rok(cell_index).mean,1)<30) 
    [r_rok,t_rok]=max(cell_rok(cell_index).mean);
   [r_myosin,t_myosin]=max(cell_myosin(cell_index).mean);
  end
   cell(cell_index).average_maxima_distance = abs(t_myosin-t_rok);
  
   
   AVERAGE_wildtype=[AVERAGE_wildtype;cell(cell_index).average_maxima_distance]; 
   
 

end

AVERAGE_wildtype;

%%


  subplot(2,2,2)
 boxplot(.106*AVERAGE_wildtype)
     title('Wild Type')
     ylabel('Microns');
     ylim([0 16])
     hold on 

%%
%%PLOT histogram
 subplot(2,2,4)
 hist(.106*AVERAGE_wildtype)
     title('Wild Type')
     ylim([0 100]);
    h = findobj(gca,'Type','patch');
set(h,'FaceColor',[0 .5 .5],'EdgeColor','w');
     hold on 
