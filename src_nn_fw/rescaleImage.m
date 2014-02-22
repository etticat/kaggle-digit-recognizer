function originalImages= rescaleImage(originalImages)
    for i=1:size(originalImages, 3)
        singleDigitOriginal = originalImages(:,:,i);
        singleDigit = singleDigitOriginal > 50;
        for j=0:size(singleDigit, 1)
            if ~any(singleDigit(1,:))
                singleDigit = singleDigit(2:end,:);
                singleDigitOriginal = singleDigitOriginal(2:end,:);
            else
                break
            end
        end

        for j=0:size(singleDigit, 2)
            if ~any(singleDigit(:,1))
                singleDigit = singleDigit(:,2:end);
                singleDigitOriginal = singleDigitOriginal(:,2:end);
            else
                break
            end

        end
        for j=0:size(singleDigit, 2)
            rowCount = size(singleDigit, 2);
            if ~any(singleDigit(:,rowCount))
                singleDigit = singleDigit(:,1:end-1);
                singleDigitOriginal = singleDigitOriginal(:,1:end-1);
            else
                break
            end

        end
        for j=0:size(singleDigit, 1)
            columnCount = size(singleDigit, 1);
            if ~any(singleDigit(columnCount,:))
                singleDigit = singleDigit(1:end-1,:);
                singleDigitOriginal = singleDigitOriginal(1:end-1,:);
            else
                break
            end
        end
        
        before = false;
        or2 = singleDigitOriginal;
        while(size(or2,1) ~= size(or2, 2))
            if(size(or2,1) > size(or2, 2))        
                if(before)
                    or2 = [ones(size(or2, 1),1)-1 or2];
                else
                    or2 = [or2 ones(size(or2, 1),1)-1];
                end;
            else 
                if(before)
                    or2 = [ones(size(or2, 2),1)-1 or2']';
                else
                    or2 = [or2' ones(size(or2, 2),1)-1]';
                end
            end;
            before  = ~before;
        end
        
        
        originalImages(:,:,i) = imresize(or2, [28 28]);
    end
end