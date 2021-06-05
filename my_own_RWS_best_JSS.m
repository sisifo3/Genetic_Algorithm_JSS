function [index] = my_own_RWS_best_JSS(Ce_cmp)
% generamos la probabilidad de que sean seleccionados, esta aumenta 
%dependiendo de su fitness
%creamos un valor prioridad.
len_v = length(Ce_cmp);
vec_prio = zeros(len_v,1);
for le = 1:len_v
    vec_prio(le,1) = Ce_cmp{le,3};
end
%[1] = previous_probability + (fitness / sum_of_fitness) = 0.0 + (1 / 10) = 0.1
%previous_probability = 0.1
vec_prio = flipud(vec_prio); %invertimos los valores 
sum_vec_prio = sum(vec_prio);
prob_selec = vec_prio/sum_vec_prio;   %Generamos todo la matriz con los resultados (fitness / sum_of_fitness)
%Generamos la probabilidad de ser seleccionado la suma de pre_pro + (fit/sum)
proba = zeros(1,len_v);
prev_proba = 0;
for km = 1:len_v
    proba(km) = prev_proba + prob_selec(km,1);
    prev_proba = proba(km);
end
%Escogemos al asar el numero en index que necesitamos.
%xbp = flipud(proba);
num_rand = rand;
%disp(num_rand)
for ksr = 1:len_v
    if num_rand < proba(ksr)
        index = ksr;
        return
    end
end
