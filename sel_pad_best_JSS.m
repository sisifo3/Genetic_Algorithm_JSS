function [padre1,padre2] =  sel_pad_best_JSS(Ce_cmp)    
%global selection_metodo 
padre1 = zeros(1,18);
padre2 = zeros(1,18);
for rl = 1:2
    if rl ==1
       [index] = selection_method_LRS_jss(Ce_cmp);   
       %[index] = my_own_RWS_best_JSS(Ce_cmp);
       padre1 = Ce_cmp{index,1};
    end
    if rl ==2
        [index] = selection_method_LRS_jss(Ce_cmp);
        %[index] = my_own_RWS_best_JSS(Ce_cmp);
        padre2 = Ce_cmp{index,1};
    end
end
 
end