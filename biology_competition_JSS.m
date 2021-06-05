function[more_stronge] = biology_competition_JSS(cell_pred_desc)

[cell_out] =  delete_repeated_JSS(cell_pred_desc);

len_bc = length(cell_out);
len_bc_two = len_bc/2;
cell_str = zeros(len_bc_two,3);
cell_str = num2cell(cell_str);

for str = 1:len_bc_two
    cell_str(str,:) = cell_out(str,:);
end

%disp(cell_str)

more_stronge = cell_str;

end