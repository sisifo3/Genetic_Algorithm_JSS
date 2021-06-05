function[desc1,desc2] = crossover_PMx_b(pred1,pred2)

%pred1 = [3,4,5,1,2,6,7,8,7,3,2,1,6,7,2,3,3,2,2];
%pred2 = [8,7,1,2,6,3,5,4,6,2,1,3,7,3,7,2,2,3,2];

%b1 = zeros(1,5);
%b2 = zeros(1,5);

%b1(1,:) = pred1(1,[9:13]);
%b2(1,:) = pred2(1,[9:13]);

%pred1 = b1;
%pred2 = b2;


nir = randi(3);
mat_one = zeros(2,3);
ident_mat = zeros(2,2);


for old = 1:nir
    mat_one(1,old) = pred1(old);
    mat_one(2,old) = pred2(old);    
end
nar = nir+2;
ner = 5-nar;
for olp = 1:ner
    mat_one(1,nir+olp) = pred1(nar+olp);
    mat_one(2,nir+olp) = pred2(nar+olp);
end

for gh = 1:2
    ident_mat(2,gh) = pred1(gh+nir);
    ident_mat(1,gh) = pred2(gh+nir);
end

disp(mat_one)
disp(ident_mat)
%for this part of the code we have the matrx identidy [ident_mat] and 
%the matriz for comparation [mat_one]
count_it = 0;
var_a = [];
fatal_error = 1;
while fatal_error ~= 0    
    count_it = count_it + 1;
    count = 0;
   
    for olr = 1:3
        for olt = 1:2
            if mat_one(1,olr) == ident_mat(1,olt) 
                temp_var_a = mat_one(1,olr);
                mat_one(1,olr) = mat_one(2,olr);
                mat_one(2,olr) = temp_var_a;
                var_a = [var_a,olr];
                count = count + 1;
            end 
             if mat_one(2,olr) == ident_mat(2,olt) 
                temp_var_b = mat_one(2,olr);
                mat_one(2,olr) = mat_one(1,olr);
                mat_one(1,olr) = temp_var_b;
                var_a = [var_a,olr];
                count = count +1;
            end

        end
    end    

    %Now we have a array that it's compared and changed depend of the simility of
    %mat_one and ident_mat;
    %it the next we compare mat_one inside for a repeat value.

    for olte = 1:3
        for oly = 1:3
            if mat_one(1,olte) == mat_one(1,oly) && olte ~= oly
                exist_olte = any(var_a(:) == olte);
                if exist_olte == 0
                    temp_varb = mat_one(1,olte);
                    mat_one(1,olte) = mat_one(2,olte);
                    mat_one(2,olte) = temp_varb;
                    var_a = [var_a,olte];
                    count = count +1;
                end    
            end
            if mat_one(2,olte) == mat_one(2,oly) && olte ~= oly
                exist_oltbe = any(var_a(:) == olte);
                if exist_oltbe == 0
                    temp_varb = mat_one(2,olte);
                    mat_one(2,olte) = mat_one(1,olte);
                    mat_one(1,olte) = temp_varb;
                    var_a = [var_a,olte];
                    count = count +1;
                end    
             end
        end
    end    
    
    fatal_error = 0;
    for olz = 1:3
        for olw = 1:3
            if mat_one(1,olz) == mat_one(1,olw) && olz ~= olw
                
                fatal_error = 1;
                count = count +1;  
            end
            if mat_one(2,olz) == mat_one(2,olw) && olz ~= olw
               
                count = count +1;  
                fatal_error = 1;
            end

        end
    end    

    for oln = 1:3
        for olm = 1:2
            if mat_one(1,oln) == ident_mat(1,olm) && oln ~= olm
               
                fatal_error = 1;
            end
            if mat_one(2,oln) == ident_mat(2,olm) && oln ~= olm
               
                fatal_error = 1;
            end
        end
    end    
end




disp(mat_one)
disp(ident_mat)


desc1 = zeros(1,5); 
desc2 = zeros(1,5);
nir = randi(3);
nar = nir+2;
ner = 5-nar;
for olu = 1:nir
    desc1(olu) = mat_one(1,olu);
    desc2(olu) = mat_one(2,olu);
end
for oli = 1:2
    desc1(nir+oli) = ident_mat(1,oli);
    desc2(nir+oli) = ident_mat(2,oli);
end

for ole = 1:ner
    desc1(nar+ole) = mat_one(1,nir+ole);
    desc2(nar+ole) = mat_one(2,nir+ole);
end  
%and the last just for security we check the last time
%for repeat values.


for ot = 1:5
    for op = 1:5
        
        if desc1(1,ot) == desc1(1,op) && ot ~= op
            disp('fatal Global error line 1')
            disp(pred1)
            disp(desc1)
        end
        if desc2(1,ot) == desc2(1,op) && ot ~= op
            disp('fatal Global error line 2')
            disp(pred2)
            disp(desc2)
            
        end   
    end
end    


disp(desc1)
disp(desc2)

end
