function[chrom,fitness,it,fit_glob,conv] = yellow_sub()

cell = zeros(10,3);
cell = num2cell(cell);

cell_n = zeros(20,3);
cell_n = num2cell(cell_n);

for i =1:10
    [chrom]  = generate_chrom_jss();
    [distance,fitness] = makespan_jss_p(chrom);
    cell{i,1} = chrom;
    cell{i,2} = distance;
    cell{i,3} = fitness;
end

[cell] = ord_insertion_JSS(cell);

cell_n([1:10],:) = cell([1:10],:);

generations = 40;
fit_glob = zeros(1,generations);
it = zeros(1,generations);
conv = 30;
for j = 1:generations
    for k = 1:5
        [pred1,pred2] =  sel_pad_best_JSS(cell);
        [desc1,desc2] = method_crossover_CESX_JSS(pred1,pred2);
        
        [distance1,fitness1] = makespan_jss_p(desc1);
        [distance2,fitness2] = makespan_jss_p(desc2);

        cell_n{k+10,1} = desc1;
        cell_n{k+10,2} = distance1;
        cell_n{k+10,3} = fitness1;
        cell_n{k+15,1} = desc2;
        cell_n{k+15,2} = distance2;
        cell_n{k+15,3} = fitness2;
          
    end
    
    [cell_n] = ord_insertion_JSS(cell_n);
    [cell_n] = biology_competition_JSS(cell_n);
        
    tm = cell_n{1,3};
    fit_glob(1,j) = tm;
    it(1,j) = j; 
    cell = cell_n;
    if j > 1
        if fit_glob(1,j) > fit_glob(1,j-1)
            conv = j;
       
        end
    end 
        
    
end
%figure(1)
%plot(it,fit_glob)
%hold on
%xlabel('Generaciones')
%ylabel('Makespan')
chrom = cell{1,1};
fitness = cell{1,2};
%figure(2)
%graph_g(chrom);
%disp(conv)



%figure(1)
%figure(2)
end
