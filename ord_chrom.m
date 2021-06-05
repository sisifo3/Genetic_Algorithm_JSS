function[chrom,time] = ord_chrom(chrom,time)
celda_num  = chrom;

for i = 1: length(chrom)
    d = i;
    while((d > 1) && (chrom(d)) < (chrom(d-1)))
        var_temp = chrom(d);
        chrom(d) = chrom(d-1);
        chrom(d-1) = var_temp;
        
        var_temp = time(d);
        time(d) = time(d-1);
        time(d-1) = var_temp;
        
        d = d-1;
    end
end    


celda_ord= celda_num;
end