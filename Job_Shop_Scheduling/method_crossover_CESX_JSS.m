function[desc1,desc2] = method_crossover_CESX_JSS(pred1,pred2)

%pred1 = [8,2,2,1,6,6,3,2,3,1,7,7,7,4,2,2,5,3,3];
%pred2 = [1,2,2,8,3,2,3,6,6,1,7,5,7,3,2,2,7,3,4];

cell = zeros(8,3);
cell = num2cell(cell);

loma = zeros(8,19);

loma(7,:) = pred1(:);
loma(8,:) = pred2(:);

for i =1:3
    loma(i,:) = pred1(:);
    loma(3+i,:) = pred2(:);
    rp1 = randperm(19,4);
    rp2 = randperm(19,4);
    tp1 = pred1(1,rp1(1));
    tp2 = pred2(1,rp2(1));
    loma(i,rp1(1)) = pred1(1,rp1(2));
    loma(i,rp1(2)) = pred1(1,rp1(3));
    loma(i,rp1(3)) = pred1(1,rp1(4));
    loma(i,rp1(4)) = tp1;
    loma(i+3,rp2(1)) = pred2(1,rp2(2));
    loma(i+3,rp2(2)) = pred2(1,rp2(3));
    loma(i+3,rp2(3)) = pred2(1,rp2(4));
    loma(i+3,rp2(4)) = tp2;
    chrom1 = loma(i,:);
    chrom2 = loma(i+3,:);
    [ord1,fitness1] = makespan_jss_p(chrom1);
    [ord2,fitness2] = makespan_jss_p(chrom2);
    cell{i,1} = chrom1;
    cell{i,2} = ord1;
    cell{i,3} = fitness1;
    cell{i+3,1} = chrom2;
    cell{i+3,2} = ord2;
    cell{i+3,3} = fitness2;
end

for j = 1:8
    chrom1 = loma(j,:);
    [ord1,fitness1] = makespan_jss_p(chrom1);
    cell{j,1} = chrom1;
    cell{j,2} = ord1;
    cell{j,3} = fitness1;
end

[cell] = ord_insertion_JSS(cell);

desc1 = cell{1,1};
desc2 = cell{2,1};
end