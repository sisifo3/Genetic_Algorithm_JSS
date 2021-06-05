function[anser] = scramble_met_per_one_JSS(gen_loc_rep)

%gen_loc_rep = randperm(8,8);

gen_loc_sc = zeros(1,19);
mat_rep_one = zeros(1,14);
mat_rep_two = zeros(1,5);

for sma = 1:1
    
    nsm = randi(14);
    %nsm = 3;
    nsma = nsm + 5;
    nsmb = 19-nsma;
    for smb = 1:nsm
        mat_rep_one(smb) = gen_loc_rep(smb);
    end
    for smc = 1:5
        mat_rep_two(smc) = gen_loc_rep(smc+nsm);
    end
    for smd = 1:nsmb
        mat_rep_one(smd+nsm) = gen_loc_rep(nsma + smd);
    end
    
    nsm_m = randi(14);
    %nsm_m = 5;
    nsm_ma = nsm_m + 5; 
    nsm_mb = 19-nsm_ma;
    for sme = 1:nsm_m
        gen_loc_sc(sme) = mat_rep_one(sme);
    end
    for smf = 1:5
        gen_loc_sc(smf+nsm_m) = mat_rep_two(smf);
    end
    for smg = 1:nsm_mb
        gen_loc_sc(nsm_ma+smg) = mat_rep_one(smg+nsm_m);
    end
    
end


anser = gen_loc_sc;        


end