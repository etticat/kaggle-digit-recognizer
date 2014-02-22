function showDigit(digit)

digit = reshape(digit, 28, 28);
-imagesc(squeeze(digit), [0 255]); 
-colormap(gray);

end