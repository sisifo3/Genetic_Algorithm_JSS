function[cell_nor] =  delete_repeated_JSS(cell_act)


cookie_loc = zeros(19,1);
a = zeros(1,19);
gen_mut = zeros(1,19);

len_dt = length(cell_act);
%disp(len_dt)
for dtl = 1:len_dt
    for dtla = 1:len_dt
        exist_cookie = any(cookie_loc(:) == dtla);
        if cell_act{dtl,3} == cell_act{dtla,3} && dtl ~= dtla && exist_cookie == 0
            cookie_loc(dtl) = dtl;
            gen_loc_rep = cell_act{dtla,1};
            %disp(gen_loc_rep)
            a(1,:) = gen_loc_rep(1,:);
            %disp(gen_loc_rep)
            [a] = scramble_met_per_one_JSS(a);
            gen_mut(1,:) = a(1,:);
            %gen_mut(1,9:19) = gen_loc_rep(1,9:19);
            [ord,fitness] = makespan_jss_p(gen_mut);
            cell_act{dtla,1} = gen_mut;  
            cell_act{dtla,2} = ord;
            cell_act{dtla,3} = fitness;
        end
    end  

end

[cell_act] = ord_insertion_JSS(cell_act);

cell_nor = cell_act;
end
