function[] = amkespan_jss_a()

chrom = [3,4,5,1,2,6,7,8,7,3,2,1,6,7,2,3,3,2,2];

mach = csvread('mach.csv');
dist = csvread('time_jss.csv');


tent = zeros (19,4);
tent(:,1) = chrom;

tent([1:8],2) = mach(tent([1:8],1),1);
tent([9:13],2) = mach(tent([9:13],1),2);
tent([14:16],2) = mach(tent([14:16],1),3);
tent([17:18],2) = mach(tent([17:18],1),4);
tent(19,2) = mach(tent(19,1),5);
%disp(tent)

for i = 1:19
    tent(i,3) = dist(tent(i,2), tent(i,1));
end
%disp(tent)



end