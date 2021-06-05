function[desc1,desc2] = crossover_PMx_d(pred1,pred2)
temporal = zeros(2,2);
temporal(1,:) = pred1(1,:);
temporal(2,:) = pred2(1,:);

n = randi(2);

desc1 = temporal(n,:);
desc2 = temporal(3-n,:);

end