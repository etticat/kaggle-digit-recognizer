function result = rescaleImage(singleDigitOriginal)
    singleDigit = singleDigitOriginal > 128;
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
    result = imresize(singleDigitOriginal, [28 28]);
end