function submissionMatrix = loadSubmission(fileName, accuracy)

submissionMatrix = ones(28000,10)-1;

file = fopen(fileName);
textscan(file, '%s', 2, 'delimiter', ',');
data = textscan(file, '%d', 'delimiter', ',');
fclose(file);
asdf = reshape(data{:},2, 28000)';
asdf = asdf(:,[2]);

for i=1:size(asdf)
    submissionMatrix(i,asdf(i,1)+1) = accuracy;
end


end