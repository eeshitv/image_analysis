for cell_index=start_cell%: end_cell%just selecting cell indices for plotting randomly
 %%plot the shadederrorbars
 
 
    p=cell(cell_index).mean';
    p=p(:,1:30);
    %plot(mean_C')
    
    subplot(2,1,i);%subtract the first index -1 here so that the subplot input never goes above 20
 % imshow( cell(cell_index).ANS);
    
   %hold on;
  if(rok)
   plot(1:size( p,2), p,'Color','g');
  end
   if(~rok)
   plot(1:size( p,2), p,'Color','r');
  end
    %axis([0,30,0,190]);
     title(cell(cell_index).index)
     hold on
 
end


