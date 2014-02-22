%eva = evalclusters(X,'kmeans','CalinskiHarabasz', 'KList', [9:20]);

X_kmeans = X';

IDX=kmeans(X_kmeans,20);
isTen = IDX == 5;

sizeX = size(isTen, 1);
X_kmeans_ten = [];

first = true;
for i=1:sizeX
    if(isTen(i,1) == 1)
        if(first)
            X_kmeans_ten = X_kmeans(i,:);
            first = false;
        else
            X_kmeans_ten = [X_kmeans_ten' X_kmeans(i,:)']';
        end
        
    end
    
end

for i= 1: size(X_kmeans_ten,1)
    showDigit(X_kmeans_ten(i,:))
    pause
end;