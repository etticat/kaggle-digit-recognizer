function showDigit(digit)

 ran_show = randi(42000, [25,1]);
 count=1;
 show_arr = digit(:,:,ran_show(1));
 
 for i=1:5
     show_arr = digit(:,:,ran_show(count));
     for j=1:4         
         count = count+1;
         show_arr = [show_arr,digit(:,:,ran_show(count))];
     end
     
         subplot(5,1,i);
         imshow(show_arr);     
 end
    
 pause;

end