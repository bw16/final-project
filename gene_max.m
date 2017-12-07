
gene=load('Gene.mat');
count = 1;
maximum = 0;
gene_max = '';
for ii = 3:length(gene.Gene)
    if gene.Gene(ii-1) == gene.Gene(ii)
        count = count + 1;
        if count > maximum
            maximum = count;
            gene_max = gene.Gene(ii);
        end
    else
        count = 1;
    end
end
maximum
gene_max
        