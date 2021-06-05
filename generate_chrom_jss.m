function[lschrom]  = generate_chrom_jss()

a =  randperm(8,8);
at =  randperm(19,19);

chrom = a;
b =  randperm(7,7);
ba = [4,5];
bb = zeros(1,5);
c = randperm(7,7);
ca = [1,4,5,6];
cc = zeros(1,3);
d = randperm(3,3);
dd = zeros(1,2);
e = 2;

sa = 1;
for i = 1:7
    s = ismember(b(i),ba);
    if s == 0
        bb(sa) = b(1,i);
        sa = sa +1 ;
    end    
end

sc = 1;
for j = 1:7
    s = ismember(c(j),ca);
    if s == 0
        cc(sc) = c(1,j);
        sc = sc +1 ;
    end    
end

sd = 1;
for k = 1:3
    
    if  d(k) ~= 1
        dd(sd) = d(1,k);
        sd = sd +1 ;
    end    
end
%n = randi(4);
chrom  = [chrom,bb]; %n
chrom  = [chrom,cc]; 
chrom  = [chrom,dd];
chrom  = [chrom,e];


lschrom(:) = chrom(at(:));



%disp(chrom)

end