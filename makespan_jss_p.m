function[ord,fitness] = makespan_jss_p(chrom)

%chrom = [8,2,2,1,6,2,3,6,3,1,7,7,7,4,2,2,5,3,3];

mach = csvread('mach.csv');
dist = csvread('time_jss.csv');

machine = zeros(14,1);
tent = zeros (19,4);
index = zeros(8,5);
tent(:,1) = chrom(1,:);

v = [];
n = 1;

for i = 1:19
    
    for j = 1:length(v)
        c = any(v(1,j) == chrom(1,i));
        n = n + c;
    end
    
    index(chrom(1,i),n) = i;
    tent(i,2) = mach(chrom(1,i),n);
    tent(i,3) = dist(tent(i,2), tent(i,1));
    
    if n == 1
        indx = index(chrom(1,i),n);
        if machine(tent(i,2),1) >= tent(indx,4)
            tent(i,4) = machine(tent(i,2),1) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        else
            tent(i,4) = tent(indx,4) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        end    
    
    elseif n > 1
        indx = index(chrom(1,i),n-1);
        if machine(tent(i,2),1) >= tent(indx,4)
            tent(i,4) = machine(tent(i,2),1) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        else
            tent(i,4) = tent(indx,4) + tent(i,3);
            machine(tent(i,2),1) = tent(i,4);
        end    
    end            
    v = [v,chrom(1,i)];
    n = 1;
end
[ord] = ord_insertion_makespace(tent);
%fitness = 1000/ord;
ms  = sum(machine(:,1));
fitness = 1000/ms;

%disp(ms)
end
